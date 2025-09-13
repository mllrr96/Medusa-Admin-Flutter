import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/features/team/presentation/bloc/invite_crud/invite_crud_bloc.dart';

class InviteUser extends StatefulWidget {
  const InviteUser({super.key});

  @override
  State<InviteUser> createState() => _InviteUserState();
}

class _InviteUserState extends State<InviteUser> {
  final emailCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late final InviteCrudBloc inviteBloc;

  @override
  void initState() {
    inviteBloc = InviteCrudBloc.instance;
    super.initState();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    inviteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InviteCrudBloc, InviteCrudState>(
      bloc: inviteBloc,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            loading();
          },
          error: (message) {
            context.showSnackBar(message.toSnackBarString());
            dismissLoading();
            context.pop();
          },
          created: () {
            dismissLoading();
            context.showSnackBar('Invite sent to ${emailCtrl.text}');
            context.pop(true);
          },
        );
      },
      child: Form(
        key: formKey,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: context.bottomViewInsetPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppBar(
                  title: const Text('Invite User'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: emailCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      minimumSize: Size(double.maxFinite, 48),
                    ),
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      inviteBloc.add(InviteCrudEvent.create(emailCtrl.text));
                    },
                    child: const Text('Send Invite'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
