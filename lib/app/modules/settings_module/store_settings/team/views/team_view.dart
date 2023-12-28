import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/invite/invite_repo.dart';
import 'package:medusa_admin/app/data/repository/user/user_repo.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/search_text_field.dart';
import 'package:medusa_admin/app/modules/settings_module/store_settings/team/controllers/team_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../components/adaptive_icon.dart';
import '../components/index.dart';
import '../controllers/invite_controller.dart';

@RoutePage()
class TeamView extends StatelessWidget {
  const TeamView({super.key});

  @override
  Widget build(BuildContext context) {
    const kDuration = Duration(milliseconds: 200);
    final lightWhite = ColorManager.manatee;
    return GetBuilder<TeamController>(
        init: TeamController(userRepo: UserRepo()),
        builder: (teamController) {
          return GetBuilder<InviteController>(
              init: InviteController(inviteRepo: InviteRepo()),
              builder: (inviteController) {
                return Scaffold(
                  appBar: AppBar(
                    leading: const AdaptiveBackButton(),
                    title: const Text('The Team'),
                    bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(kToolbarHeight),
                        child: Obx(() {
                          final membersCount = teamController
                                      .membersCount.value ==
                                  1
                              ? '${teamController.membersCount.value} Member'
                              : '${teamController.membersCount.value} Members';
                          return AnimatedCrossFade(
                            firstChild: Row(
                              children: [
                                const SizedBox(width: 12.0),
                                Expanded(
                                    child: SearchTextField(
                                  fillColor:
                                      context.theme.scaffoldBackgroundColor,
                                  controller: teamController.searchCtrl,
                                  hintText: 'Search for team email, name',
                                  onChanged: (val) {
                                    if (val !=
                                        teamController.searchCtrl.text) {}
                                  },
                                )),
                                AdaptiveButton(
                                  child: const Text('Cancel'),
                                  onPressed: () async {
                                    context.unfocus();
                                    teamController.search.value = false;
                                  },
                                ),
                              ],
                            ),
                            secondChild: SizedBox(
                              height: kToolbarHeight,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      AdaptiveIcon(
                                          onPressed: () async {
                                            teamController.search.value = true;
                                          },
                                          icon: const Icon(
                                              CupertinoIcons.search)),
                                      AdaptiveIcon(
                                          onPressed: () async {},
                                          icon: const Icon(
                                              CupertinoIcons.sort_down)),
                                    ],
                                  ),
                                  if (teamController.membersCount.value != 0)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(membersCount,
                                          style: context.bodySmall),
                                    )
                                ],
                              ),
                            ),
                            crossFadeState: teamController.search.value
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: kDuration,
                          );
                        })),
                  ),
                  floatingActionButton: FloatingActionButton.extended(
                      onPressed: () async {
                        if (Platform.isIOS) {
                          await showCupertinoModalBottomSheet(
                              context: context,
                              builder: (_) => const InviteUserCard());
                        } else {
                          await showModalBottomSheet(
                              context: context,
                              builder: (_) => const InviteUserCard(),
                              isScrollControlled: true);
                        }
                      },
                      label: const Text('Invite users'),
                      icon: const Icon(Icons.add)),
                  body: SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        SliverPersistentHeader(
                            delegate: PersistentHeader('Team members')),
                        teamController.obx(
                          (users) => SliverList(
                              delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return TeamCard(
                                user: users[index],
                                onEditTap: () async {
                                  if (Platform.isIOS) {
                                    await showCupertinoModalBottomSheet(
                                        context: context,
                                        builder: (_) =>
                                            UpdateUserCard(user: users[index]));
                                  } else {
                                    await showModalBottomSheet(
                                        context: context,
                                        builder: (_) =>
                                            UpdateUserCard(user: users[index]),
                                        isScrollControlled: true);
                                  }
                                },
                                onDeleteTap: () async {
                                  await showOkCancelAlertDialog(
                                    context: context,
                                    title: 'Remove user',
                                    message:
                                        'Are you sure you want to remove this user?',
                                    okLabel: 'Yes, remove',
                                    isDestructiveAction: true,
                                  ).then(
                                    (value) async {
                                      if (value == OkCancelResult.ok) {
                                        await teamController
                                            .deleteUser(users[index].id!);
                                      }
                                    },
                                  );
                                },
                              );
                            },
                            childCount: users!.length,
                          )),
                          onLoading: const SliverFillRemaining(
                            child: Center(
                                child: CircularProgressIndicator.adaptive()),
                          ),
                          onError: (e) => SliverToBoxAdapter(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(e ?? 'Error loading users'),
                                FilledButton(
                                    onPressed: () async =>
                                        teamController.loadUsers(),
                                    child: const Text('Retry'))
                              ],
                            ),
                          ),
                        ),
                        SliverPersistentHeader(
                            pinned: true,
                            delegate: PersistentHeader('Invites')),
                        inviteController.obx(
                          (invites) => SliverList(
                              delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return InviteCard(
                                invite: invites[index],
                                onResendTap: () => inviteController
                                    .resendInvite(invites[index].id!),
                                onDeleteTap: () async {
                                  await showOkCancelAlertDialog(
                                    context: context,
                                    title: 'Remove invite',
                                    message:
                                        'Are you sure you want to remove this invite?',
                                    okLabel: 'Yes, remove',
                                    isDestructiveAction: true,
                                  ).then((value) async {
                                    if (value == OkCancelResult.ok) {
                                      await inviteController
                                          .deleteInvite(invites[index].id!);
                                    }
                                  });
                                },
                              );
                            },
                            childCount: invites!.length,
                          )),
                          onLoading: const SliverToBoxAdapter(
                            child: Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          ),
                          onError: (e) => SliverToBoxAdapter(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(e ?? 'Error loading invites'),
                                FilledButton(
                                    onPressed: () async =>
                                        inviteController.loadInvites(),
                                    child: const Text('Retry'))
                              ],
                            ),
                          ),
                          onEmpty: SliverToBoxAdapter(
                            child: Center(
                              child: Text(
                                'No invites',
                                style: TextStyle(color: lightWhite),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  PersistentHeader(this.text);

  final String text;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final lightWhite = ColorManager.manatee;
    return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        color: Theme.of(context).scaffoldBackgroundColor,
        height: kToolbarHeight,
        child: Text(
          text,
          style: TextStyle(color: lightWhite),
        ));
  }

  @override
  double get maxExtent => kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight / 1.5;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
