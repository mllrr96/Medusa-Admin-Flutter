import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/personal_information_controller.dart';

class PersonalInformationView extends GetView<PersonalInformationController> {
  const PersonalInformationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Information'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PersonalInformationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
