import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/extensions/string_extension.dart';
import 'package:medusa_admin/src/core/utils/custom_text_field.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/core/utils/hide_keyboard.dart';
import 'package:medusa_admin/src/features/api_keys/presentation/bloc/api_key_crud/api_key_crud_bloc.dart';
import 'package:medusa_admin/src/features/sales_channels/presentation/bloc/sales_channel_crud/sales_channel_crud_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';

@RoutePage()
class AddUpdateApiKeyView extends StatefulWidget {
  const AddUpdateApiKeyView({super.key, this.publishableApiKey, this.type});

  final ApiKey? publishableApiKey;
  final ApiKeyType? type;

  @override
  State<AddUpdateApiKeyView> createState() => _AddUpdateApiKeyViewState();
}

class _AddUpdateApiKeyViewState extends State<AddUpdateApiKeyView> {
  late final ApiKeyCrudBloc apiKeyCrudBloc;

  bool get updateMode => widget.publishableApiKey != null;
  final titleCtrl = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    apiKeyCrudBloc = ApiKeyCrudBloc.instance;
    if (updateMode) {
      titleCtrl.text = widget.publishableApiKey!.title;
    }


    super.initState();
  }

  @override
  void dispose() {
    apiKeyCrudBloc.close();
    titleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    return BlocListener<ApiKeyCrudBloc, ApiKeyCrudState>(
      bloc: apiKeyCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          loading: (_) => loading(),
          apiKey: (_) {
            dismissLoading();
            context.showSnackBar('Api key created');
            context.maybePop();
          },
          error: (e) {
            dismissLoading();
            context.showSnackBar(e.failure.toSnackBarString());
          },
        );
      },
      child: HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            title: updateMode ? const Text('Update Api Key') : const Text('Create New Api Key'),
            actions: [
              TextButton(
                onPressed: () {
                  if (!keyForm.currentState!.validate()) {
                    return;
                  }
                  context.unfocus();
                  if (updateMode) {
                    apiKeyCrudBloc
                        .add(ApiKeyCrudEvent.update(widget.publishableApiKey!.id, titleCtrl.text));
                  } else {
                    assert(
                        widget.type != null, 'Type must be provided when creating a new api key');
                    apiKeyCrudBloc.add(ApiKeyCrudEvent.create(titleCtrl.text, widget.type!));
                  }
                },
                child: const Text('Publish'),
              ),
            ],
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              children: [
                Form(
                  key: keyForm,
                  child: FlexExpansionTile(
                    title: const Text('General Information'),
                    initiallyExpanded: true,
                    child: Column(
                      children: [
                        if(!updateMode)
                        Text(
                          widget.type == ApiKeyType.secret
                              ? 'Create a new secret API key to access the Medusa API as an authenticated admin user.'
                              : 'Create a new publishable API key to limit the scope of requests to specific sales channels.',
                          style: smallTextStyle?.copyWith(color: manatee),
                        ),
                        space,
                        LabeledTextField(
                          label: 'Title',
                          controller: titleCtrl,
                          hintText: 'Name your key',
                          required: true,
                          validator: (val) {
                            if (val == null || val.removeAllWhitespace.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          },
                        )
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
