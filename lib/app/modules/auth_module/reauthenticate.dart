import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/app/modules/components/bottom_nav_bar_button.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import 'sign_in/components/index.dart';

@RoutePage()
class ReAuthenticateView extends StatefulWidget {
  const ReAuthenticateView({super.key});

  @override
  State<ReAuthenticateView> createState() => _ReAuthenticateViewState();
}

class _ReAuthenticateViewState extends State<ReAuthenticateView> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailCtrl.text = 'admin@medusa-test.com';
    passwordCtrl.text = 'supersecret';
    super.initState();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReAuthenticate'),
      ),
      bottomNavigationBar: BottomNavigationBarButton(
          onPress: () async {
            if (!formKey.currentState!.validate()) {
              return;
            }
            loading();
            await getIt<MedusaAdmin>()
                .authRepository
                .signIn(
                    req: UserPostAuthReq(
                        email: emailCtrl.text, password: passwordCtrl.text))
                .then((user) {
              if (user != null) {
                context.popRoute(true);
              }
            });
          },
          label: 'Authenticate'),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const Text('Your session has expired, please login again'),
            EmailTextField(
              controller: emailCtrl,
              validator: (val) {
                if (val?.isEmpty ?? true) {
                  return 'Email is required';
                }

                if (!val!.isEmail) {
                  return 'Invalid Email';
                }

                return null;
              },
            ),
            PasswordTextField(
              controller: passwordCtrl,
              validator: (val) {
                if (val != null && val.isEmpty) {
                  return 'Password is required';
                }
                if (val!.length < 8) {
                  return 'Password should be at least 8 characters long';
                }

                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
