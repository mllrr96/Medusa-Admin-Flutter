import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class MetadataCard extends StatelessWidget {
  const MetadataCard({super.key, required this.keyCtrl, required this.valueCtrl, this.onDelete});
  final TextEditingController keyCtrl;
  final TextEditingController valueCtrl;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12.0),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: LabeledTextField(
                      label: 'Key',
                      controller: keyCtrl,
                      hintText: 'Some key',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Field required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: onDelete,
                      icon: const Icon(Icons.delete_forever, color: Colors.red),
                    ),
                  ),
                ],
              ),
              LabeledTextField(
                label: 'Value',
                controller: valueCtrl,
                hintText: 'Some value',
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Field required';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
