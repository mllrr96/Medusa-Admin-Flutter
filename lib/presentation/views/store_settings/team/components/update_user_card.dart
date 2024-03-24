import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

class UpdateUserCard extends StatefulWidget {
  const UpdateUserCard({super.key, required this.user, this.onUpdated});
  final User user;
  final void Function(UpdateUserReq)? onUpdated;
  @override
  State<UpdateUserCard> createState() => _UpdateUserCardState();
}

class _UpdateUserCardState extends State<UpdateUserCard> {
  final emailCtrl = TextEditingController();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final tokenCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailCtrl.text = widget.user.email ?? '';
    firstNameCtrl.text = widget.user.firstName ?? '';
    lastNameCtrl.text = widget.user.lastName ?? '';
    tokenCtrl.text = widget.user.apiToken ?? '';
    super.initState();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    tokenCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewPadding.bottom +
            MediaQuery.of(context).viewInsets.bottom,
        left: 12.0,
        right: 12.0,
        top: 8.0,
      ),
      child: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => context.maybePop(),
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }

                        if (user.firstName == firstNameCtrl.text &&
                            user.lastName == lastNameCtrl.text &&
                            user.apiToken == tokenCtrl.text) {
                          context.maybePop();
                          return;
                        }

                        widget.onUpdated?.call(UpdateUserReq(
                          firstName: firstNameCtrl.text,
                          lastName: lastNameCtrl.text,
                          apiToken:
                              tokenCtrl.text.isNotEmpty ? tokenCtrl.text : null,
                        ));
                      },
                      child: const Text('Update')),
                ],
              ),
              const SizedBox(height: 12.0),
              LabeledTextField(
                label: 'First Name',
                autoFocus: true,
                controller: firstNameCtrl,
                required: true,
                hintText: 'First name ...',
                validator: (val) {
                  if (val == null || val.removeAllWhitespace.isEmpty) {
                    return 'First name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12.0),
              LabeledTextField(
                label: 'Last Name',
                controller: lastNameCtrl,
                textInputAction: TextInputAction.done,
                required: true,
                hintText: 'Last name ...',
                validator: (val) {
                  if (val == null || val.removeAllWhitespace.isEmpty) {
                    return 'Last name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12.0),
              LabeledTextField(
                label: 'Email',
                readOnly: true,
                controller: emailCtrl,
                hintText: 'Lebron@james.com',
              ),
              const SizedBox(height: 12.0),
              LabeledTextField(
                label: 'Api Token',
                controller: tokenCtrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
