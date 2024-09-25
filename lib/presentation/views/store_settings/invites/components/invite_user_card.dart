import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class InviteUserCard extends StatefulWidget {
  const InviteUserCard({super.key, this.onInvite});
  final void Function(String, UserRole)? onInvite;
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
    return ShadDialog(
      actions: [
        ShadButton.outline(
          onPressed: () => context.maybePop(),
         child: const Text('Cancel'),
        ),
        ShadButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              widget.onInvite?.call(emailCtrl.text, selectedRole);
            }
          },
         child: const Text('Invite'),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: formKey,
            child: ShadInputFormField(
              label: const Text('Email'),
              autofocus: true,
              controller: emailCtrl,
              placeholder: const Text('Lebron@james.com'),
              validator: (val) {
                if (val.removeAllWhitespace.isEmpty) {
                  return 'Email is required';
                }
                return null;
              },
            ),
          ),
          const Gap(6.0),
          Text('Role', style: mediumTextStyle),
          const Gap(6.0),
          SizedBox(
            width: double.infinity,
            child: ShadSelect<UserRole>(
              initialValue: selectedRole,
              placeholder: const Text('Select role'),
              onChanged: (role) => selectedRole = role,
              options: UserRole.values
                  .map((e) => ShadOption<UserRole>(
                      value: e, child: Text(e.name.capitalize)))
                  .toList(),
              selectedOptionBuilder: (context, value) =>
                  Text(value.name.capitalize),
            ),
          ),
        ],
      ),
    );
  }
}
