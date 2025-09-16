import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/src/core/utils/custom_text_field.dart';
import 'package:medusa_admin/src/core/utils/labeled_chip_input_text_field.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

class AddOptionView extends StatefulWidget {
  const AddOptionView({
    super.key,
  });

  @override
  State<AddOptionView> createState() => _AddOptionViewState();
}

class _AddOptionViewState extends State<AddOptionView> {
  final formKey = GlobalKey<FormState>();
  final optionCtrl = TextEditingController();
  final variantsFocusNode = FocusNode();
  List<String> variants = [];

  @override
  void dispose() {
    variantsFocusNode.dispose();
    optionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 8.0,
          left: 12.0,
          right: 12.0,
          bottom: MediaQuery.of(context).viewInsets.bottom +
              MediaQuery.of(context).padding.bottom),
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.maybePop(ProductOption(
                          title: optionCtrl.text,
                          values: variants
                              .map((e) => ProductOptionValue(
                                  value: e,
                                  optionId: '',
                                  variantId: '',
                                  id: ''))
                              .toList(),
                          productId: null,
                          id: ''));
                    }
                  },
                  child: const Text('Add')),
            ],
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                LabeledTextField(
                  label: 'Option title',
                  onFieldSubmitted: (_) => variantsFocusNode.requestFocus(),
                  controller: optionCtrl,
                  textCapitalization: TextCapitalization.sentences,
                  autoFocus: true,
                  hintText: 'Color...',
                  validator: (val) {
                    if (val != null && val.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  },
                ),
                LabeledChipTextField(
                  focusNode: variantsFocusNode,
                  label: 'Variations (comma separated)',
                  onChanged: (val) => setState(() => variants = val),
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  textCapitalization: TextCapitalization.words,
                  inputDecoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    hintText: 'Blue, Red, Black...',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                  validator: (val) {
                    if (variants.isEmpty) {
                      return 'Variants can\'t be empty';
                    }
                    return null;
                  },
                ),
                // LabeledTextField(
                //   label: 'Variations (comma separated)',
                //   controller: variationsCtrl,
                //   hintText: 'Blue, Red, Black...',
                //   textInputAction: TextInputAction.done,
                //   validator: (val) {
                //     if (val != null && val.isEmpty) {
                //       return 'Field is required';
                //     }
                //     return null;
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
