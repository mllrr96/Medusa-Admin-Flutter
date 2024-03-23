import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/presentation/blocs/api_key_crud/api_key_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class AddUpdateApiKeyView extends StatefulWidget {
  const AddUpdateApiKeyView({super.key, this.publishableApiKey});
  final PublishableApiKey? publishableApiKey;

  @override
  State<AddUpdateApiKeyView> createState() => _AddUpdateApiKeyViewState();
}

class _AddUpdateApiKeyViewState extends State<AddUpdateApiKeyView> {
  late ApiKeyCrudBloc apiKeyCrudBloc;
  bool get updateMode => widget.publishableApiKey != null;
  final titleCtrl = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  @override
  void initState() {
    apiKeyCrudBloc = ApiKeyCrudBloc.instance;
    if (updateMode) {
      titleCtrl.text = widget.publishableApiKey!.title ?? '';
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
            title: updateMode
                ? const Text('Update Api Key')
                : const Text('Create New Api Key'),
            actions: [
              TextButton(
                onPressed: () {
                  if (!keyForm.currentState!.validate()) {
                    return;
                  }
                  context.unfocus();
                  if (updateMode) {
                    apiKeyCrudBloc.add(ApiKeyCrudEvent.update(
                        widget.publishableApiKey!.id!, titleCtrl.text));
                  } else {
                    apiKeyCrudBloc.add(ApiKeyCrudEvent.create(titleCtrl.text));
                  }
                },
                child: const Text('Publish'),
              ),
            ],
          ),
          body: SafeArea(
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              children: [
                Form(
                  key: keyForm,
                  child: FlexExpansionTile(
                    title: const Text('General Information'),
                    initiallyExpanded: true,
                    child: Column(
                      children: [
                        Text(
                          'Create and manage API keys. Right now this is only related to sales channels.',
                          style: smallTextStyle?.copyWith(color: manatee),
                        ),
                        space,
                        LabeledTextField(
                          label: 'Title',
                          controller: titleCtrl,
                          hintText: 'Name your key',
                          required: true,
                          validator: (val) {
                            if (val == null ||
                                val.removeAllWhitespace.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                ),
                space,
                FlexExpansionTile(
                  title: const Text('Sales channels'),
                  child: Column(
                    children: [
                      Text(
                        'Connect as many sales channels to your API key as you need.',
                        style: smallTextStyle?.copyWith(color: manatee),
                      ),
                      space,
                    ],
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
