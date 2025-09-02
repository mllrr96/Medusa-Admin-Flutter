import 'package:flutter/material.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'team_card.dart';

class TeamLoadingPage extends StatelessWidget {
  const TeamLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const user = User(
        email: 'Medusa@js.com',
        // role: UserRole.admin,
        firstName: 'Medusa',
        lastName: 'Admin', id: '', role: '');
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(10, (index) => const TeamCard(user: user)),
      ),
    );
  }
}
