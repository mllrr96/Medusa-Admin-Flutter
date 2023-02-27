import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/team_controller.dart';

class TeamView extends GetView<TeamController> {
  const TeamView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TeamView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TeamView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
