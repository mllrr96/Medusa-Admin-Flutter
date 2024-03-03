import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/blocs/user_crud/user_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'components/index.dart';

@RoutePage()
class TeamView extends StatefulWidget {
  const TeamView({super.key});

  @override
  State<TeamView> createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {
  late UserCrudBloc userCrudBloc;
  final refreshController = RefreshController();
  final pagingController =
      PagingController<int, User>(firstPageKey: 0, invisibleItemsThreshold: 3);

  void _loadPage(int _) {
    userCrudBloc.add(UserCrudEvent.loadAll(queryParameters: {
      'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
    }));
  }

  @override
  void initState() {
    userCrudBloc = UserCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    userCrudBloc.close();
    refreshController.dispose();
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCrudBloc, UserCrudState>(
      bloc: userCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          users: (state) async {
            final isLastPage = state.users.length < UserCrudBloc.pageSize;
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value = const PagingState(
                  nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(state.users);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.users.length;
              pagingController.appendPage(state.users, nextPageKey);
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
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const MedusaSliverAppBar(title: Text('The Team')),
          ],
          body: SmartRefresher(
            controller: refreshController,
            onRefresh: () => _loadPage(0),
            child: PagedListView(
              // padding: EdgeInsets.zero,
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<User>(
                // animateTransitions: true,
                itemBuilder: (context, user, index) {
                  return TeamCard(
                    user: user,
                    onEditTap: () async {
                      if (Platform.isIOS) {
                        await showCupertinoModalBottomSheet(
                            context: context,
                            builder: (_) => UpdateUserCard(
                                user: user,
                                onUpdated: (userUpdateUserReq) {
                                  userCrudBloc.add(UserCrudEvent.update(
                                      user.id!, userUpdateUserReq));
                                }));
                      } else {
                        await showModalBottomSheet(
                            context: context,
                            builder: (_) => UpdateUserCard(
                                user: user,
                                onUpdated: (userUpdateUserReq) {
                                  userCrudBloc.add(UserCrudEvent.update(
                                      user.id!, userUpdateUserReq));
                                }),
                            isScrollControlled: true);
                      }
                    },
                    onDeleteTap: () async {
                      if (await delete) {
                        userCrudBloc.add(UserCrudEvent.delete(user.id!));
                      }
                    },
                  );
                },
                // firstPageProgressIndicatorBuilder: (_) =>
                //     const TeamLoadingPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> get delete async => await showOkCancelAlertDialog(
        context: context,
        title: 'Remove user',
        message: 'Are you sure you want to remove this user?',
        okLabel: 'Yes, remove',
        isDestructiveAction: true,
      ).then((value) => value == OkCancelResult.ok);
}
