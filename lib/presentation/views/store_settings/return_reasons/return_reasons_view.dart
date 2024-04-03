import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/presentation/blocs/return_reasons_crud/return_reasons_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'components/return_reason_list_tile.dart';

@RoutePage()
class ReturnReasonsView extends StatefulWidget {
  const ReturnReasonsView({super.key});

  @override
  State<ReturnReasonsView> createState() => _ReturnReasonsViewState();
}

class _ReturnReasonsViewState extends State<ReturnReasonsView> {
  final pagingController = PagingController<int, ReturnReason>(
      firstPageKey: 0, invisibleItemsThreshold: 6);
  final RefreshController refreshController = RefreshController();
  late ReturnReasonsCrudBloc returnReasonsBloc;
  late ReturnReasonsCrudBloc returnReasonsCrudBloc;

  void _loadPage(int _) {
    returnReasonsBloc.add(
      ReturnReasonsCrudEvent.loadAll(queryParameters: {
        'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
      }),
    );
  }

  @override
  void initState() {
    returnReasonsBloc = ReturnReasonsCrudBloc.instance;
    returnReasonsCrudBloc = ReturnReasonsCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    returnReasonsBloc.close();
    returnReasonsCrudBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ReturnReasonsCrudBloc, ReturnReasonsCrudState>(
          bloc: returnReasonsBloc,
          listener: (context, state) {
            state.mapOrNull(
              returnReasons: (state) async {
                final isLastPage =
                    state.returnReasons.length < ReturnReasonsCrudBloc.pageSize;
                if (refreshController.isRefresh) {
                  pagingController.removePageRequestListener(_loadPage);
                  pagingController.value = const PagingState(
                      nextPageKey: null, error: null, itemList: null);
                  await Future.delayed(const Duration(milliseconds: 250));
                }
                if (isLastPage) {
                  pagingController.appendLastPage(state.returnReasons);
                } else {
                  final nextPageKey = pagingController.nextPageKey ??
                      0 + state.returnReasons.length;
                  pagingController.appendPage(state.returnReasons, nextPageKey);
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
        ),
        BlocListener<ReturnReasonsCrudBloc, ReturnReasonsCrudState>(
          bloc: returnReasonsCrudBloc,
          listener: (context, state) {
            state.maybeMap(
              loading: (_) => loading(),
              deleted: (_) {
                dismissLoading();
                context.showSnackBar('Return Reason Deleted Successfully');
                pagingController.refresh();
              },
              error: (state) {
                dismissLoading();
                context.showSnackBar(state.failure.toSnackBarString());
              },
              orElse: () => dismissLoading(),
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Return Reasons'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async => await context
              .pushRoute(CreateUpdateReturnReasonRoute())
              .then((value) {
            if (value == true) {
              pagingController.refresh();
            }
          }),
          label: const Text('Add Return Reason'),
          icon: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: SmartRefresher(
            controller: refreshController,
            onRefresh: () => _loadPage(0),
            child: SlidableAutoCloseBehavior(
              child: PagedListView.separated(
                separatorBuilder: (_, __) => const Divider(height: 0),
                pagingController: pagingController,
                builderDelegate: PagedChildBuilderDelegate<ReturnReason>(
                  animateTransitions: true,
                  itemBuilder: (context, returnReason, index) =>
                      ReturnReasonCard(
                    returnReason,
                    listTiltStyle: true,
                    onDelete: () {
                      returnReasonsCrudBloc.add(
                        ReturnReasonsCrudEvent.delete(returnReason.id!),
                      );
                    },
                    onAfterEdit: () {
                      pagingController.refresh();
                    },
                  ),
                  firstPageProgressIndicatorBuilder: (_) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  firstPageErrorIndicatorBuilder: (_) =>
                      PaginationErrorPage(pagingController: pagingController),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
