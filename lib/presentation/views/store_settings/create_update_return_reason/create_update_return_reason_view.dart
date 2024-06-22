import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/presentation/blocs/return_reasons_crud/return_reasons_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class CreateUpdateReturnReasonView extends StatefulWidget {
  const CreateUpdateReturnReasonView({super.key, this.returnReason});

  final ReturnReason? returnReason;

  @override
  State<CreateUpdateReturnReasonView> createState() =>
      _CreateUpdateReturnReasonViewState();
}

class _CreateUpdateReturnReasonViewState
    extends State<CreateUpdateReturnReasonView> {
  final labelCtrl = TextEditingController();
  final valueCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool get updateMode => widget.returnReason != null;

  late ReturnReasonsCrudBloc returnReasonsCrudBloc;

  @override
  void initState() {
    returnReasonsCrudBloc = ReturnReasonsCrudBloc.instance;
    if (updateMode) {
      labelCtrl.text = widget.returnReason!.label ?? '';
      valueCtrl.text = widget.returnReason!.value ?? '';
      descriptionCtrl.text = widget.returnReason!.description ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    returnReasonsCrudBloc.close();
    labelCtrl.dispose();
    valueCtrl.dispose();
    descriptionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReturnReasonsCrudBloc, ReturnReasonsCrudState>(
      bloc: returnReasonsCrudBloc,
      listener: (context, state) {
        state.maybeMap(
            loading: (_) => loading(),
            returnReason: (_) {
              context.showSnackBar(
                  'Return Reason ${updateMode ? 'Updated' : 'Created'}');
              context.maybePop(true);
              dismissLoading();
            },
            error: (error) {
              dismissLoading();
              context.showSnackBar(error.failure.toSnackBarString());
            },
            orElse: () => dismissLoading());
      },
      child: HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            title: updateMode
                ? const Text('Update Return Reason')
                : const Text('Create Return Reason'),
            actions: [
              ShadButton.ghost(
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  context.unfocus();

                  if (updateMode &&
                      labelCtrl.text == widget.returnReason!.label &&
                      valueCtrl.text == widget.returnReason!.value &&
                      descriptionCtrl.text ==
                          widget.returnReason!.description) {
                    context.maybePop();
                    return;
                  }

                  if (updateMode) {
                    returnReasonsCrudBloc.add(ReturnReasonsCrudEvent.update(
                      widget.returnReason!.id!,
                      UpdateReturnReasonReq(
                          label: labelCtrl.text,
                          value: valueCtrl.text,
                          description: descriptionCtrl.text),
                    ));
                  } else {
                    returnReasonsCrudBloc.add(
                      ReturnReasonsCrudEvent.create(CreateReturnReasonReq(
                          label: labelCtrl.text,
                          value: valueCtrl.text,
                          description:
                              descriptionCtrl.text.removeAllWhitespace.isEmpty
                                  ? null
                                  : descriptionCtrl.text)),
                    );
                  }
                },
                text: updateMode ? const Text('Update') : const Text('Create'),
              )
            ],
          ),
          body: SafeArea(
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              children: [
                Form(
                  key: formKey,
                  child: ShadCard(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ShadInputFormField(
                          label: const Text('Label'),
                          controller: labelCtrl,
                          placeholder: const Text('Wrong Size'),
                          validator: (val) {
                            if (val.removeAllWhitespace.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          },
                        ),
                        ShadInputFormField(
                          label: const Text('Value'),
                          controller: valueCtrl,
                          placeholder: const Text('wrong_size'),
                          enabled: !updateMode,
                          style: updateMode
                              ? context.bodySmall?.copyWith(color: Colors.grey)
                              : null,
                          validator: (val) {
                            if (updateMode) {
                              return null;
                            }
                            if (val.removeAllWhitespace.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          },
                        ),
                        ShadInputFormField(
                          label: const Text('Description'),
                          controller: descriptionCtrl,
                          placeholder:
                              const Text('Customer received the wrong size'),
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
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
