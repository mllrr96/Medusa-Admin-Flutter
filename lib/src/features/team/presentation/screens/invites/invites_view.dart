import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/core/utils/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/src/features/team/presentation/bloc/invite_crud/invite_crud_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'components/index.dart';
import 'components/invite_user.dart';

@RoutePage()
class InvitesView extends StatefulWidget {
  const InvitesView({super.key});

  @override
  State<InvitesView> createState() => _InvitesViewState();
}

class _InvitesViewState extends State<InvitesView> {
  late InviteCrudBloc invitesBloc;
  late InviteCrudBloc inviteCrudBloc;
  final pagingController =
      PagingController<int, Invite>(firstPageKey: 0, invisibleItemsThreshold: 3);
  final refreshController = RefreshController();

  void _loadPage(int page) {
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
                final isLastPage = state.invites.length < InviteCrudBloc.pageSize;
                if (refreshController.isRefresh) {
                  pagingController.removePageRequestListener(_loadPage);
                  pagingController.value =
                      const PagingState(nextPageKey: null, error: null, itemList: null);
                  await Future.delayed(const Duration(milliseconds: 250));
                }
                if (isLastPage) {
                  pagingController.appendLastPage(state.invites);
                } else {
                  final nextPageKey = pagingController.nextPageKey ?? 0 + state.invites.length;
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
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(LucideIcons.userPlus),
          onPressed: () async {
            final result = await showModalBottomSheet<bool?>(
              context: context,
              isScrollControlled: true,
              builder: (context) => const InviteUser(),
            );
            if (result == true) {
              pagingController.refresh();
            }
          },
          label: Text('Invite'),
        ),
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
                noItemsFoundIndicatorBuilder: (context) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        LucideIcons.userMinus,
                        size: 64,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No invites found',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                animateTransitions: true,
                itemBuilder: (context, invite, index) {
                  return InviteCard(
                    invite: invite,
                    onResendTap: () => inviteCrudBloc.add(InviteCrudEvent.resend(invite.id)),
                    onDeleteTap: () async {
                      if (await delete) {
                        inviteCrudBloc.add(InviteCrudEvent.delete(invite.id));
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
