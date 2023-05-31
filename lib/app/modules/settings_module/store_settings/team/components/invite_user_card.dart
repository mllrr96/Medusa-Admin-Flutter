import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../components/adaptive_button.dart';
import '../../../../components/custom_text_field.dart';
import '../controllers/invite_controller.dart';

class InviteUserCard extends StatefulWidget {
  const InviteUserCard({Key? key}) : super(key: key);

  @override
  State<InviteUserCard> createState() => _InviteUserCardState();
}

class _InviteUserCardState extends State<InviteUserCard> {
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var selectedRole = UserRole.member;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewPadding.bottom + MediaQuery.of(context).viewInsets.bottom,
        left: 12.0,
        right: 12.0,
        top: 8.0,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AdaptiveButton(onPressed: () => Get.back(), child: const Text('Cancel')),
                AdaptiveButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await InviteController.instance.inviteUser(email: emailCtrl.text, role: selectedRole);
                      }
                    },
                    child: const Text('Invite')),
              ],
            ),
            const SizedBox(height: 12.0),
            Form(
              key: formKey,
              child: LabeledTextField(
                label: 'Email',
                autoFocus: true,
                controller: emailCtrl,
                required: true,
                hintText: 'Lebron@james.com',
                validator: (val) {
                  if (val == null || val.removeAllWhitespace.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 6.0),
            Text('Role', style: mediumTextStyle),
            const SizedBox(height: 6.0),
            DropdownButtonFormField<UserRole>(
              value: selectedRole,
              onChanged: (role) {
                if (role != null) {
                  selectedRole = role;
                }
              },
              items: UserRole.values
                  .map((e) => DropdownMenuItem<UserRole>(value: e, child: Text(e.name.capitalize ?? e.name)))
                  .toList(),
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
