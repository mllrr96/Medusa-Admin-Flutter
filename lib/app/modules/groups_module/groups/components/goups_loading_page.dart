import 'package:flutter/material.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'group_card.dart';

class GroupsLoadingPage extends StatelessWidget {
  const GroupsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const group = CustomerGroup(name: 'Medusa', customers: [], id: '1');
    return Column(
      children: List.generate(
          10,
          (index) => Skeletonizer(
              enabled: true,
              child: GroupCard(customerGroup: group, index: index))),
    );
  }
}
