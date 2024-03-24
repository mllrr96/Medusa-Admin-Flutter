import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';

import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
class InviteUserCard extends StatefulWidget {
  const InviteUserCard({super.key, this.onInvite});
  final void Function()? onInvite;
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
    final mediumTextStyle = context.bodyMedium;
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
                TextButton(onPressed: () => context.maybePop(), child: const Text('Cancel')),
                TextButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        widget.onInvite?.call();

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
              style: context.bodyMedium,
              value: selectedRole,
              onChanged: (role) {
                if (role != null) {
                  selectedRole = role;
                }
              },
              items: UserRole.values
                  .map((e) => DropdownMenuItem<UserRole>(value: e, child: Text(e.name.capitalize)))
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
