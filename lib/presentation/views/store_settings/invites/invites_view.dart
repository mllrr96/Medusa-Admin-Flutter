import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/presentation/blocs/invite_crud/invite_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'components/index.dart';

@RoutePage()
class InvitesView extends StatefulWidget {
  const InvitesView({super.key});

  @override
  State<InvitesView> createState() => _InvitesViewState();
}

class _InvitesViewState extends State<InvitesView> {
  late InviteCrudBloc invitesBloc;
  late InviteCrudBloc inviteCrudBloc;
  final pagingController = PagingController<int, Invite>(
      firstPageKey: 0, invisibleItemsThreshold: 3);
  final refreshController = RefreshController();

  void _loadPage(int _) {
    invitesBloc.add(const InviteCrudEvent.loadAll());
  }

  @override
  void initState() {
    invitesBloc = InviteCrudBloc.instance;
    inviteCrudBloc = InviteCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    invitesBloc.close();
    inviteCrudBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<InviteCrudBloc, InviteCrudState>(
          bloc: invitesBloc,
          listener: (context, state) {
            state.mapOrNull(
              invites: (state) async {
                final isLastPage =
                    state.invites.length < InviteCrudBloc.pageSize;
                if (refreshController.isRefresh) {
                  pagingController.removePageRequestListener(_loadPage);
                  pagingController.value = const PagingState(
                      nextPageKey: null, error: null, itemList: null);
                  await Future.delayed(const Duration(milliseconds: 250));
                }
                if (isLastPage) {
                  pagingController.appendLastPage(state.invites);
                } else {
                  final nextPageKey =
                      pagingController.nextPageKey ?? 0 + state.invites.length;
                  pagingController.appendPage(state.invites, nextPageKey);
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
        BlocListener<InviteCrudBloc, InviteCrudState>(
          bloc: inviteCrudBloc,
          listener: (context, state) {
            state.mapOrNull(
              loading: (_) => loading(),
              deleted: (_) {
                dismissLoading();
                pagingController.refresh();
                context.showSnackBar('Invite deleted');
              },
              resent: (_) {
                dismissLoading();
                // pagingController.refresh();
                context.showSnackBar('Invite resent');
              },
              error: (state) {
                dismissLoading();
                context.showSnackBar(state.failure.toSnackBarString());
              },
            );
          },
        ),
      ],
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const MedusaSliverAppBar(title: Text('Invites')),
          ],
          body: SmartRefresher(
            controller: refreshController,
            onRefresh: () => _loadPage(0),
            child: PagedListView(
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<Invite>(
                itemBuilder: (context, invite, index) {
                  return InviteCard(
                    invite: invite,
                    onResendTap: () =>
                        inviteCrudBloc.add(InviteCrudEvent.resend(invite.id!)),
                    onDeleteTap: () async {
                      if (await delete) {
                        inviteCrudBloc.add(InviteCrudEvent.delete(invite.id!));
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> get delete async => await showOkCancelAlertDialog(
        context: context,
        title: 'Remove invite',
        message: 'Are you sure you want to remove this invite?',
        okLabel: 'Yes, remove',
        isDestructiveAction: true,
      ).then((value) => value == OkCancelResult.ok);
}
