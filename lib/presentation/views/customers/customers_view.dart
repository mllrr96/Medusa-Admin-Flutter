import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin/presentation/blocs/customer_crud/customer_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/presentation/widgets/search_floating_action_button.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'components/index.dart';

@RoutePage()
class CustomersView extends StatefulWidget {
  const CustomersView({super.key});

  @override
  State<CustomersView> createState() => _CustomersViewState();
}

class _CustomersViewState extends State<CustomersView> {
  final refreshController = RefreshController();
  final PagingController<int, Customer> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);
  late CustomerCrudBloc customerCrudBloc;

  void _loadPage(int _) {
    customerCrudBloc.add(
      CustomerCrudEvent.loadAll(queryParameters: {
        'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
        'expand': 'orders',
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
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerCrudBloc, CustomerCrudState>(
      bloc: customerCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          customers: (state) async {
            final isLastPage =
                state.customers.length < CustomerCrudBloc.pageSize;
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value = const PagingState(
                  nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(state.customers);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.customers.length;
              pagingController.appendPage(state.customers, nextPageKey);
            }
            if (refreshController.isRefresh) {
              pagingController.addPageRequestListener(_loadPage);
              refreshController.refreshCompleted();
            }
          },
          error: (state) {
            refreshController.refreshFailed();
            pagingController.error = state.failure;
          },
        );
      },
      child: HideKeyboard(
        child: Scaffold(
          drawer: const AppDrawer(),
          drawerEdgeDragWidth: context.drawerEdgeDragWidth,
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SearchFloatingActionButton(
                      searchCategory: SearchCategory.customers),
                  Gap(4.0),
                ],
              ),
              const Gap(6.0),
              FloatingActionButton.extended(
                onPressed: () async {
                  final result = await context
                      .pushRoute(AddUpdateCustomerRoute(customer: null));
                  if (result is bool) {
                    pagingController.refresh();
                  }
                },
                label: const Text('New Customer'),
                icon: const Icon(Icons.person_add),
              ),
            ],
          ),
          body: SlidableAutoCloseBehavior(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MedusaSliverAppBar(
                  title: Builder(builder: (context) {
                    final customersCount = customerCrudBloc.state.mapOrNull(
                            customers: (state) =>
                                state.count > 0 ? state.count : null) ??
                        0;
                    return Text(
                        customersCount != 0
                            ? 'Customers ($customersCount)'
                            : 'Customers',
                        overflow: TextOverflow.ellipsis);
                  }),
                ),
              ],
              body: SmartRefresher(
                controller: refreshController,
                onRefresh: () => _loadPage(0),
                child: PagedListView(
                  pagingController: pagingController,
                  padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.4),
                  builderDelegate: PagedChildBuilderDelegate<Customer>(
                    animateTransitions: true,
                    itemBuilder: (context, customer, index) => CustomerListTile(
                      customer,
                      index: index,
                      onEditTap: (_) async {
                        final result = await context.pushRoute(
                            AddUpdateCustomerRoute(customer: customer));
                        if (result is bool) {
                          pagingController.refresh();
                        }
                      },
                    ),
                    firstPageProgressIndicatorBuilder: (_) =>
                        const CustomersLoadingPage(),
                    firstPageErrorIndicatorBuilder: (context) =>
                        PaginationErrorPage(pagingController: pagingController),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
