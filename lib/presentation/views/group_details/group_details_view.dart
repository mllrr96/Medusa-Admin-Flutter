import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/medusa_model_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/data/models/pick_customer_req.dart';
import 'package:medusa_admin/data/models/pick_customer_res.dart';
import 'package:medusa_admin/presentation/blocs/customer_crud/customer_crud_bloc.dart';
import 'package:medusa_admin/presentation/blocs/group_crud/group_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/widgets/scrolling_expandable_fab.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

@RoutePage()
class GroupDetailsView extends StatefulWidget {
  const GroupDetailsView(this.customerGroup, {super.key});
  final CustomerGroup customerGroup;

  @override
  State<GroupDetailsView> createState() => _GroupDetailsViewState();
}

class _GroupDetailsViewState extends State<GroupDetailsView> {
  final PagingController<int, Customer> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);
  late CustomerCrudBloc customerCrudBloc;

  void _loadPage(int _) {
    customerCrudBloc.add(
      CustomerCrudEvent.loadAll(queryParameters: {
        'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
        'expand': 'groups',
      }),
    );
  }

  @override
  void initState() {
    customerCrudBloc = CustomerCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    customerCrudBloc.close();
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    return MultiBlocListener(
      listeners: [
        BlocListener<CustomerCrudBloc, CustomerCrudState>(
          bloc: customerCrudBloc,
          listener: (context, state) {
            state.mapOrNull(
              loading: (_) => loading(),
              customers: (state) async {
                final isLastPage =
                    state.customers.length < CustomerCrudBloc.pageSize;
                if (pagingController.value.itemList == null) {
                  pagingController.appendPage(state.customers, 0);
                }
                if (isLastPage) {
                  pagingController.appendLastPage(state.customers);
                } else {
                  final nextPageKey =
                      pagingController.nextPageKey! + state.customers.length;
                  pagingController.appendPage(state.customers, nextPageKey);
                }
                dismissLoading();
              },
              error: (error) {
                dismissLoading();
                context.showSnackBar(error.failure.toSnackBarString());
              },
            );
          },
        ),
        BlocListener<GroupCrudBloc, GroupCrudState>(
          listener: (context, state) {
            state.mapOrNull(
              loading: (_) => loading(),
              group: (_) {
                dismissLoading();
              },
              error: (error) {
                dismissLoading();
                context.showSnackBar(error.failure.toSnackBarString());
              },
              deleted: (deleted) {
                dismissLoading();
                context.showSnackBar('Group deleted successfully');
                context.router.pop();
              },
            );
          },
        ),
      ],
      child: Scaffold(
          floatingActionButton: ScrollingExpandableFab(
            controller: ScrollController(),
            label: 'Add Customers',
            icon: const Icon(CupertinoIcons.person_add_solid),
            onPressed: () async => await addCustomers(),
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: Text(widget.customerGroup.name ?? ''),
                actions: [
                  IconButton(
                      onPressed: () async {
                        await showModalActionSheet<int>(
                            title: 'Manage group',
                            message: widget.customerGroup.name ?? '',
                            context: context,
                            actions: <SheetAction<int>>[
                              const SheetAction(label: 'Edit', key: 0),
                              const SheetAction(
                                  label: 'Delete',
                                  isDestructiveAction: true,
                                  key: 1),
                            ]).then((result) async {
                          switch (result) {
                            case 0:
                              await context
                                  .pushRoute(CreateUpdateGroupRoute(
                                      customerGroup: widget.customerGroup))
                                  .then((value) {
                                if (value is CustomerGroup) {

                                  // customerGroup = value;
                                  // GroupsController.instance.pagingController
                                  //     .refresh();
                                }
                              });
                              break;
                            case 1:
                              if (await removeCustomer && context.mounted) {
                                context.read<GroupCrudBloc>().add(
                                    GroupCrudEvent.delete(
                                        widget.customerGroup.id!));
                              }

                              break;
                          }
                        });
                      },
                      icon: const Icon(Icons.more_horiz))
                ],
              ),
              PagedSliverList(
                pagingController: pagingController,
                builderDelegate: PagedChildBuilderDelegate<Customer>(
                    itemBuilder: (context, customer, index) {
                      final name = customer.fullName;
                      return ListTile(
                        onTap: () => context.pushRoute(
                            CustomerDetailsRoute(customerId: customer.id!)),
                        leading: CircleAvatar(
                          backgroundColor:
                              ColorManager.getAvatarColor(customer.email),
                          radius: 16,
                          child: Text(
                              name?[0].capitalize ??
                                  customer.email[0].capitalize,
                              style: largeTextStyle?.copyWith(
                                  color: Colors.white)),
                        ),
                        title: Text(name ?? customer.email),
                        subtitle: name != null
                            ? Text(customer.email, style: smallTextStyle)
                            : null,
                        trailing: IconButton(
                            onPressed: () async {
                              await showModalActionSheet<int>(
                                  context: context,
                                  actions: <SheetAction<int>>[
                                    const SheetAction(
                                        label: 'Customer details', key: 0),
                                    const SheetAction(
                                        label: 'Delete from the group',
                                        isDestructiveAction: true,
                                        key: 1),
                                  ]).then((result) async {
                                switch (result) {
                                  case 0:
                                    context.pushRoute(CustomerDetailsRoute(
                                        customerId: customer.id!));
                                    break;
                                  case 1:
                                    await showOkCancelAlertDialog(
                                            context: context,
                                            title: 'Delete the group',
                                            message:
                                                'Are you sure you want to delete this customer from  group?',
                                            okLabel: 'Yes, delete',
                                            cancelLabel: 'No, cancel',
                                            isDestructiveAction: true)
                                        .then((value) async {
                                      if (value == OkCancelResult.ok) {
                                        context.read<GroupCrudBloc>().add(
                                            GroupCrudEvent.removeCustomers(
                                                widget.customerGroup.id!,
                                                [customer.id!]));
                                      }
                                    });

                                    break;
                                }
                              });
                            },
                            icon: const Icon(Icons.more_horiz)),
                      );
                    },
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(
                            child: CircularProgressIndicator.adaptive()),
                    firstPageErrorIndicatorBuilder: (_) =>
                        PaginationErrorPage(pagingController: pagingController),
                    noItemsFoundIndicatorBuilder: (context) => const Center(
                        child: Text('No customers in this group yet'))),
              ),
            ],
          )),
    );
  }

  Future<bool> get removeCustomer async => await showOkCancelAlertDialog(
          context: context,
          title: 'Delete the group',
          message: 'Are you sure you want to delete this customer from  group?',
          okLabel: 'Yes, delete',
          cancelLabel: 'No, cancel',
          isDestructiveAction: true)
      .then((value) => value == OkCancelResult.ok);

  Future<void> addCustomers() async {
    if (pagingController.value.itemList == null) {
      return;
    }
    final pickCustomerReq = await context.pushRoute(PickCustomerRoute(
        pickCustomerReq: PickCustomerReq(
            multipleSelection: true,
            selectedCustomers: pagingController.value.itemList)));
    if (pickCustomerReq == null) {
      return;
    }
    final newCustomers = (pickCustomerReq as PickCustomerRes)
        .selectedCustomers
        .map((e) => e.id!)
        .toList();
    if (mounted) {
      context.read<GroupCrudBloc>().add(
          GroupCrudEvent.addCustomers(widget.customerGroup.id!, newCustomers));
    }
  }
}
