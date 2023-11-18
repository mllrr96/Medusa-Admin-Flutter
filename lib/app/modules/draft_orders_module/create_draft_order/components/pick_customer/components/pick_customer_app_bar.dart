import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../../components/adaptive_button.dart';
import '../../../../../components/adaptive_icon.dart';

class PickCustomerAppBar extends StatefulWidget {
  const PickCustomerAppBar({Key? key, required this.searchCtrl, this.onChanged, this.searchFocusNode}) : super(key: key);
  final TextEditingController searchCtrl;
  final void Function(String)? onChanged;
  final FocusNode? searchFocusNode;
  @override
  State<PickCustomerAppBar> createState() => _PickCustomerAppBarState();
}

class _PickCustomerAppBarState extends State<PickCustomerAppBar> {
  bool expanded = false;

  @override
  void dispose() {
    widget.searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const kDuration = Duration(milliseconds: 200);

    return AnimatedCrossFade(
      key: const ValueKey(1),
      firstChild: SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: [
            const SizedBox(width: 12.0),
            if (Platform.isIOS)
              Expanded(
                  child: CupertinoSearchTextField(
                placeholder: 'Search for customer name, email address ...',
                controller: widget.searchCtrl,
                onChanged: widget.onChanged,
              )),
            if (Platform.isAndroid)
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextFormField(
                  style: context.bodySmall,
                  onChanged: widget.onChanged,
                  decoration: const InputDecoration(
                    hintText: 'Search for customer name, email address ...',
                  ),
                ),
              )),
            AdaptiveButton(
                child: const Text('Cancel'),
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  // await Future.delayed(const Duration(milliseconds: 150));
                  setState(() {
                    expanded = false;
                    // if (controller.searchTerm.isNotEmpty) {
                    //   controller.searchTerm = '';
                    //   controller.pagingController.refresh();
                    // }
                    widget.searchCtrl.clear();
                  });
                }),
          ],
        ),
      ),
      secondChild: SizedBox(
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AdaptiveIcon(
                onPressed: () async {
                  setState(() {
                    expanded = true;
                  });
                  await Future.delayed(kDuration);
                  widget.searchFocusNode?.requestFocus();
                },
                icon: const Icon(CupertinoIcons.search)),
          ],
        ),
      ),
      crossFadeState: expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: kDuration,
    );
  }
}
