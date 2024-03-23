import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:medusa_admin/presentation/blocs/user_crud/user_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'components/personal_info_tile.dart';

@RoutePage()
class PersonalInformationView extends StatefulWidget {
  const PersonalInformationView({super.key});

  @override
  State<PersonalInformationView> createState() =>
      _PersonalInformationViewState();
}

class _PersonalInformationViewState extends State<PersonalInformationView> {
  late UserCrudBloc userCrudBloc;
  late UserCrudBloc userBloc;
  final formKey = GlobalKey<FormState>();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();

  @override
  void initState() {
    userCrudBloc = UserCrudBloc.instance;
    userBloc = UserCrudBloc.instance;
    userBloc.add(const UserCrudEvent.loadCurrentUser());
    super.initState();
  }

  @override
  void dispose() {
    userCrudBloc.close();
    userBloc.close();
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCrudBloc, UserCrudState>(
      bloc: userCrudBloc,
      listener: (context, state) {
        state.maybeMap(
          loading: (_) => loading(),
          user: (_) {
            dismissLoading();
            context.showSnackBar('User updated');
            context.maybePop();
          },
          error: (e) {
            dismissLoading();
            context.showSnackBar(e.failure.toSnackBarString());
          },
          orElse: () => dismissLoading(),
        );
      },
      child: BlocBuilder<UserCrudBloc, UserCrudState>(
        bloc: userBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Personal Information'),
            ),
            floatingActionButton: state.mapOrNull(
              user: (_) => FloatingActionButton.extended(
                onPressed: () async => await updatePersonalInformation(_.user),
                label: const Text('Edit'),
                icon: const Icon(MedusaIcons.pencil_square_solid),
              ),
            ),
            body: SafeArea(
              child: state.maybeMap(
                loading: (_) => const Skeletonizer(
                    enabled: true,
                    child: PersonalInfoTile(User(
                        email: 'admin@medusa-test.com',
                        firstName: 'Medusa',
                        lastName: 'Js'))),
                user: (_) => PersonalInfoTile(
                  _.user,
                  onTap: () async => await updatePersonalInformation(_.user),
                ),
                error: (e) => Column(
                  children: [
                    Center(child: Text(e.failure.message)),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                        onPressed: () =>
                            userBloc.add(const UserCrudEvent.loadCurrentUser()),
                        child: const Text('Retry')),
                  ],
                ),
                orElse: () => const SizedBox.shrink(),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> updatePersonalInformation(User user) async {
    firstNameCtrl.text = user.firstName ?? '';
    lastNameCtrl.text = user.lastName ?? '';
    widgetBuilder(context) {
      return Padding(
        padding: EdgeInsets.only(
            top: 8.0,
            left: 12.0,
            right: 12.0,
            bottom: MediaQuery.of(context).viewInsets.bottom +
                MediaQuery.of(context).viewPadding.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    child: const Text('Cancel'),
                    onPressed: () => context.maybePop()),
                TextButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    if (firstNameCtrl.text == user.firstName &&
                        lastNameCtrl.text == user.lastName) {
                      context.maybePop();
                    } else {
                      context.unfocus();
                      userCrudBloc.add(UserCrudEvent.update(
                          user.id!,
                          UserUpdateUserReq(
                              firstName: firstNameCtrl.text,
                              lastName: lastNameCtrl.text)));
                      context.maybePop();
                    }
                  },
                ),
              ],
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    LabeledTextField(
                      label: 'First Name',
                      hintText: 'First Name ...',
                      controller: firstNameCtrl,
                      autoFocus: true,
                      validator: (val) {
                        if (val != null && val.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),
                    LabeledTextField(
                      label: 'Last Name',
                      hintText: 'Last Name ...',
                      controller: lastNameCtrl,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        if (firstNameCtrl.text == user.firstName &&
                            lastNameCtrl.text == user.lastName) {
                          context.maybePop();
                        } else {
                          context.unfocus();
                          userCrudBloc.add(UserCrudEvent.update(
                              user.id!,
                              UserUpdateUserReq(
                                  firstName: firstNameCtrl.text,
                                  lastName: lastNameCtrl.text)));
                          context.maybePop();
                        }
                      },
                      validator: (val) {
                        if (val != null && val.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),
                  ],
                ))
          ],
        ),
      );
    }

    if (Platform.isIOS) {
      await showCupertinoModalBottomSheet(
          context: context, builder: widgetBuilder);
    } else {
      await showModalBottomSheet(
          context: context, builder: widgetBuilder, isScrollControlled: true);
    }
  }
}
