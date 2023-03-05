import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../data/models/store/user.dart';
import '../../../components/adaptive_icon.dart';
import '../controllers/team_controller.dart';

class TeamView extends GetView<TeamController> {
  const TeamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const kDuration = Duration(milliseconds: 200);
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Team'),
        centerTitle: true,
        actions: [
          AdaptiveButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [Icon(Icons.add), SizedBox(width: 5.0), Text('Invite users')],
              ))
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Obx(() {
              final membersCount = controller.membersCount.value == 1
                  ? '${controller.membersCount.value} Member'
                  : '${controller.membersCount.value} Members';
              return AnimatedCrossFade(
                firstChild: Row(
                  children: [
                    const SizedBox(width: 12.0),
                    if (GetPlatform.isIOS)
                      Expanded(
                          child: CupertinoSearchTextField(
                        placeholder: 'Search for product name, variant title ...',
                        onChanged: (val) {
                          // controller.searchTerm = val;
                          // controller.pagingController.refresh();
                        },
                      )),
                    if (GetPlatform.isAndroid)
                      Expanded(
                          child: TextFormField(
                        style: Theme.of(context).textTheme.titleSmall,
                        onChanged: (val) {
                          // controller.searchTerm = val;
                          // controller.pagingController.refresh();
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search for product name, variant title ...',
                        ),
                      )),
                    AdaptiveButton(
                        child: const Text('Cancel'),
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          controller.search.value = false;
                        }),
                  ],
                ),
                secondChild: SizedBox(
                  height: kToolbarHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AdaptiveIcon(
                              onPressed: () async {
                                controller.search.value = true;
                              },
                              icon: const Icon(CupertinoIcons.search)),
                          AdaptiveIcon(onPressed: () async {}, icon: const Icon(CupertinoIcons.sort_down)),
                        ],
                      ),
                      if (controller.membersCount.value != 0)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(membersCount, style: Theme.of(context).textTheme.titleSmall),
                        )
                    ],
                  ),
                ),
                crossFadeState: controller.search.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: kDuration,
              );
            })),
      ),
      body: SafeArea(
        child: controller.obx(
          (users) => ListView.builder(
            itemCount: users!.length,
            itemBuilder: (context, index) => TeamCard(user: users[index]),
          ),
          onLoading: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          onError: (e) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(e ?? 'Error loading users'),
              AdaptiveButton(onPressed: () async => controller.loadUser(), child: const Text('Retry'))
            ],
          ),
        ),
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  const TeamCard({
    super.key,
    required this.user,
  });
  final User user;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final email = user.email ?? '';
    final name = getName(user: user);
    final firstLetter = getName(user: user, firstLetterOnly: true);
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor, borderRadius: const BorderRadius.all(Radius.circular(16.0))),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Row(
                  children: [
                    if (firstLetter != null || email.isNotEmpty)
                      CircleAvatar(
                        child: Text(firstLetter ?? email[0], style: largeTextStyle),
                      ),
                    if (firstLetter != null || email.isNotEmpty) const SizedBox(width: 6.0),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (name != null) Text(name, style: largeTextStyle),
                          if (name != null) const SizedBox(height: 6.0),
                          Text(email, style: mediumTextStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AdaptiveIcon(onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
                  if (user.role != null) UserRoleLabel(userRole: user.role!),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  String? getName({required User user, bool firstLetterOnly = false}) {
    if (user.firstName != null && user.lastName != null) {
      if (firstLetterOnly) {
        return user.firstName![0];
      } else {
        return '${user.firstName!} ${user.lastName!}';
      }
    }
    return null;
  }
}

class UserRoleLabel extends StatelessWidget {
  const UserRoleLabel({Key? key, required this.userRole}) : super(key: key);
  final UserRole userRole;
  @override
  Widget build(BuildContext context) {
    var containerColor = ColorManager.primary.withOpacity(0.17);
    var textColor = ColorManager.primary;
    String text = 'Admin';
    switch (userRole) {
      case UserRole.admin:
        containerColor = Colors.redAccent.withOpacity(0.17);
        textColor = Colors.redAccent;
        text = 'Admin';
        break;
      case UserRole.developer:
        containerColor = Colors.orange.withOpacity(0.17);
        textColor = Colors.orange;
        text = 'Developer';
        break;
      case UserRole.member:
        containerColor = ColorManager.primary.withOpacity(0.17);
        textColor = ColorManager.primary;
        text = 'Member';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: textColor),
      ),
    );
  }
}
