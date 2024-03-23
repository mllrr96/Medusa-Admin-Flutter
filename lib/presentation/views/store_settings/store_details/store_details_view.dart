import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/presentation/blocs/store/store_bloc.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class StoreDetailsView extends StatefulWidget {
  const StoreDetailsView({super.key});

  @override
  State<StoreDetailsView> createState() => _StoreDetailsViewState();
}

class _StoreDetailsViewState extends State<StoreDetailsView> {
  final storeCtrl = TextEditingController();
  final swapLinkCtrl = TextEditingController();
  final draftOrderCtrl = TextEditingController();
  final inviteLinkCtrl = TextEditingController();
  final keyFrom = GlobalKey<FormState>();
  Store? store;
  late StoreBloc storeBloc;

  @override
  void initState() {
    storeBloc = StoreBloc.instance;
    store = context.read<StoreBloc>().state.mapOrNull(loaded: (_) => _.store);
    if (store == null) {
      context.read<StoreBloc>().add(const StoreEvent.loadStore());
      context.popRoute();
    }
    storeCtrl.text = store?.name ?? '';
    swapLinkCtrl.text = store?.swapLinkTemplate ?? '';
    inviteLinkCtrl.text = store?.inviteLinkTemplate ?? '';
    super.initState();
  }

  @override
  void dispose() {
    storeCtrl.dispose();
    swapLinkCtrl.dispose();
    draftOrderCtrl.dispose();
    inviteLinkCtrl.dispose();
    storeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    return BlocListener<StoreBloc, StoreState>(
      bloc: storeBloc,
      listener: (context, state) {
        state.maybeMap(
            loading: (_) => loading(),
            loaded: (_) {
              dismissLoading();
              context.popRoute();
              context.showSnackBar('Store details updated successfully');
              context.read<StoreBloc>().add(const StoreEvent.loadStore());
            },
            error: (_) {
              dismissLoading();
              context.showSnackBar(_.failure.toSnackBarString());
            },
            orElse: () => dismissLoading());
      },
      child: HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: context.defaultSystemUiOverlayStyle,
            title: const Text('Store Details'),
            actions: [
              TextButton(
                  child: const Text('Save'),
                  onPressed: () async {
                    if (storeCtrl.text == store?.name &&
                        (swapLinkCtrl.text == store?.swapLinkTemplate ||
                            swapLinkCtrl.text.isEmpty) &&
                        (inviteLinkCtrl.text == store?.inviteLinkTemplate ||
                            inviteLinkCtrl.text.isEmpty)) {
                      context.popRoute();
                      return;
                    }

                    if (!keyFrom.currentState!.validate()) {
                      return;
                    }
                    context.unfocus();
                    storeBloc.add(StoreEvent.updateStore(StorePostReq(
                        name: storeCtrl.text,
                        swapLinkTemplate:
                            swapLinkCtrl.text.removeAllWhitespace.isEmpty
                                ? null
                                : swapLinkCtrl.text,
                        inviteLinkTemplate:
                            inviteLinkCtrl.text.removeAllWhitespace.isEmpty
                                ? null
                                : inviteLinkCtrl.text)));
                  }),
            ],
          ),
          body: SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Manage your business details',
                      style: mediumTextStyle!.copyWith(color: manatee)),
                ),
                Form(
                  key: keyFrom,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      color:
                          Theme.of(context).expansionTileTheme.backgroundColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('General', style: largeTextStyle),
                        space,
                        LabeledTextField(
                          label: 'Store Name',
                          controller: storeCtrl,
                          validator: (value) {
                            if (value != null &&
                                value.removeAllWhitespace.isEmpty) {
                              return "Store name can't be empty ";
                            }
                            return null;
                          },
                        ),
                        const Divider(),
                        Text('Advanced settings', style: largeTextStyle),
                        space,
                        LabeledTextField(
                          label: 'Swap link template',
                          controller: swapLinkCtrl,
                          hintText: 'https://acme.inc/swap={swap_id}',
                          validator: (value) {
                            if (value != null &&
                                value.removeAllWhitespace.isNotEmpty &&
                                !value.isUrl) {
                              return "Invalid URL";
                            }
                            return null;
                          },
                        ),
                        LabeledTextField(
                          label: 'Draft order link template',
                          controller: draftOrderCtrl,
                          hintText: 'https://acme.inc/payment={payment_id}',
                          validator: (value) {
                            if (value != null &&
                                value.removeAllWhitespace.isNotEmpty &&
                                !value.isUrl) {
                              return "Invalid URL";
                            }
                            return null;
                          },
                        ),
                        LabeledTextField(
                          label: 'Invite link template',
                          controller: inviteLinkCtrl,
                          hintText:
                              'https://acme.inc/invite?token={invite_token}',
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value != null &&
                                value.removeAllWhitespace.isNotEmpty &&
                                !value.isUrl) {
                              return "Invalid URL";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
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
