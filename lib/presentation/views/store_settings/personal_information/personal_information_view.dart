import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:medusa_admin/presentation/blocs/user_crud/user_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'components/personal_info_tile.dart';
import 'components/update_personal_info_card.dart';

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userCrudBloc,
      child: BlocListener<UserCrudBloc, UserCrudState>(
        bloc: userCrudBloc,
        listener: (context, state) {
          state.maybeWhen(
            loading: () => loading(),
            user: (_) {
              dismissLoading();
              context.showSnackBar('User updated');
              userBloc.add(const UserCrudEvent.loadCurrentUser());
            },
            error: (failure) {
              dismissLoading();
              context.showSnackBar(failure.toSnackBarString());
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
                  onPressed: () async => await showShadDialog(
                      context: context,
                      builder: (context) {
                        return UpdatePersonalInfoCard(
                          user: _.user,
                          onSubmit: (userUpdate) {
                            userCrudBloc.add(
                                UserCrudEvent.update(_.user.id!, userUpdate));
                          },
                        );
                      }),
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
                    onTap: () async => await showShadDialog(
                        context: context,
                        builder: (context) {
                          return UpdatePersonalInfoCard(
                            user: _.user,
                            onSubmit: (userUpdate) {
                              userCrudBloc.add(
                                  UserCrudEvent.update(_.user.id!, userUpdate));
                            },
                          );
                        }),
                  ),
                  error: (e) => Column(
                    children: [
                      Center(child: Text(e.failure.message)),
                      const SizedBox(height: 8.0),
                      ElevatedButton(
                          onPressed: () => userBloc
                              .add(const UserCrudEvent.loadCurrentUser()),
                          child: const Text('Retry')),
                    ],
                  ),
                  orElse: () => const SizedBox.shrink(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
