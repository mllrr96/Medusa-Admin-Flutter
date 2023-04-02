import 'package:flutter/material.dart';

import 'adaptive_icon.dart';
import 'custom_text_field.dart';

class MetadataCard extends StatelessWidget {
  const MetadataCard({Key? key, required this.keyCtrl, required this.valueCtrl, this.onDelete}) : super(key: key);
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
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
                  AdaptiveIcon(onPressed: onDelete, icon: const Icon(Icons.delete_forever, color: Colors.red)),
                ],
              ),
              CustomTextField(
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
