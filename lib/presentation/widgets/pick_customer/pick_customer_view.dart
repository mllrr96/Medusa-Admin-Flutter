import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/data/models/pick_customer_req.dart';
import 'package:medusa_admin/data/models/pick_customer_res.dart';
import 'package:medusa_admin/presentation/blocs/customer_crud/customer_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

import 'components/pick_customer_app_bar.dart';

@RoutePage()
class PickCustomerView extends StatefulWidget {
  const PickCustomerView({super.key, this.pickCustomerReq});
  final PickCustomerReq? pickCustomerReq;

  @override
  State<PickCustomerView> createState() => _PickCustomerViewState();
}

class _PickCustomerViewState extends State<PickCustomerView> {
  late CustomerCrudBloc customerCrudBloc;
  final PagingController<int, Customer> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 4);
  List<Customer> selectedCustomers = [];
  List<Customer> disabledCustomers = [];
  final searchCtrl = TextEditingController();
  bool get multipleSelection =>
      widget.pickCustomerReq?.multipleSelection ?? false;

  void _loadPage(int _) {
    customerCrudBloc.add(
      CustomerCrudEvent.loadAll(queryParameters: {
        'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
        'q': searchCtrl.text,
      }),
    );
  }

  @override
  void initState() {
    customerCrudBloc = CustomerCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    if (widget.pickCustomerReq?.selectedCustomers != null) {
      selectedCustomers.addAll(widget.pickCustomerReq!.selectedCustomers!);
    }
    if (widget.pickCustomerReq?.disabledCustomers != null) {
      disabledCustomers.addAll(widget.pickCustomerReq!.disabledCustomers!);
    }
    searchCtrl.addListener(() {
      pagingController.refresh();
    });
    super.initState();
  }

  @override
  void dispose() {
    customerCrudBloc.close();
    pagingController.dispose();
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<CustomerCrudBloc, CustomerCrudState>(
        listener: (context, state) {
          state.mapOrNull(
            customers: (state) async {
              final isLastPage =
                  state.customers.length < CustomerCrudBloc.pageSize;
              if (isLastPage) {
                pagingController.appendLastPage(state.customers);
              } else {
                final nextPageKey =
                    pagingController.nextPageKey ?? 0 + state.customers.length;
                pagingController.appendPage(state.customers, nextPageKey);
              }
            },
            error: (state) {
              pagingController.error = state.failure;
            },
          );
        },
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: const CloseButton(),
                title: const Text('Pick Customer'),
                actions: [
                  TextButton(
                      onPressed: selectedCustomers.isNotEmpty
                          ? () => context.popRoute(PickCustomerRes(
                              selectedCustomers: selectedCustomers))
                          : null,
                      child: const Text('Done'))
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: PickCustomerAppBar(
                    searchCtrl: searchCtrl,
                    searchFocusNode: FocusNode(),
                  ),
                ),
              ),
              PagedSliverList.separated(
                pagingController: pagingController,
                separatorBuilder: (_, __) =>
                    const Divider(height: 0, indent: 16.0),
                builderDelegate: PagedChildBuilderDelegate<Customer>(
                  itemBuilder: (context, customer, index) {
                    final titleText = customer.firstName != null
                        ? '${customer.firstName ?? ''} ${customer.lastName ?? ''} (${customer.email})'
                        : customer.email;
                    return CheckboxListTile(
                        enabled: !disabledCustomers
                            .map((e) => e.id!)
                            .contains(customer.id),
                        title: Text(titleText),
                        value: selectedCustomers
                            .map((e) => e.id)
                            .toList()
                            .contains(customer.id),
                        selected: selectedCustomers
                            .map((e) => e.id)
                            .toList()
                            .contains(customer.id),
                        onChanged: (val) {
                          if (val == null) return;
                          if (!multipleSelection) {
                            selectedCustomers = [customer];
                            setState(() {});
                            return;
                          }

                          if (val) {
                            selectedCustomers.add(customer);
                          } else {
                            selectedCustomers
                                .removeWhere((v) => v.id == customer.id);
                          }
                          setState(() {});
                        });
                  },
                  firstPageProgressIndicatorBuilder: (context) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  firstPageErrorIndicatorBuilder: (_) =>
                      PaginationErrorPage(pagingController: pagingController),
                  noItemsFoundIndicatorBuilder: (context) =>
                      const Center(child: Text('No Customers Found')),
                ),
              ),
            ],
          ),
        ),
      );
}
