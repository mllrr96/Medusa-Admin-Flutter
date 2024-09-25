import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UpdatePersonalInfoCard extends StatefulWidget {
  const UpdatePersonalInfoCard({super.key, required this.user, this.onSubmit});
  final User user;
  final void Function(UpdateUserReq)? onSubmit;
  @override
  State<UpdatePersonalInfoCard> createState() => _UpdatePersonalInfoCardState();
}

class _UpdatePersonalInfoCardState extends State<UpdatePersonalInfoCard> {
  final formKey = GlobalKey<FormState>();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  User get user => widget.user;

  @override
  void initState() {
    firstNameCtrl.text = user.firstName ?? '';
    lastNameCtrl.text = user.lastName ?? '';
    super.initState();
  }

  @override
  void dispose() {
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: const Text('Update Personal Information'),
      actions: [
        ShadButton.ghost(
            onPressed: () => context.maybePop(),child: const Text('Cancel')),
        ShadButton(
            onPressed: () async {
              if (!formKey.currentState!.validate()) {
                return;
              }
              if (firstNameCtrl.text == user.firstName &&
                  lastNameCtrl.text == user.lastName) {
                context.maybePop();
              } else {
                context.unfocus();
                widget.onSubmit?.call(UpdateUserReq(
                    firstName: firstNameCtrl.text,
                    lastName: lastNameCtrl.text));
                context.maybePop();
              }
            },
           child: const Text('Update')),
      ],
      child: Form(
          key: formKey,
          child: Column(
            children: [
              ShadInputFormField(
                label: const Text('First Name'),
                placeholder: const Text('First Name ...'),
                controller: firstNameCtrl,
                // autoFocus: true,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
              ),
              ShadInputFormField(
                label: const Text('Last Name'),
                placeholder: const Text('Last Name ...'),
                controller: lastNameCtrl,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) async {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  if (firstNameCtrl.text == user.firstName &&
                      lastNameCtrl.text == user.lastName) {
                    context.maybePop();
                  } else {
                    context.unfocus();
                    widget.onSubmit?.call(UpdateUserReq(
                        firstName: firstNameCtrl.text,
                        lastName: lastNameCtrl.text));
                    context.maybePop();
                  }
                },
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
              ),
            ],
          )),
    );
  }
}
