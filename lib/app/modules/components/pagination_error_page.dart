import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/core/utils/extension.dart';

class PaginationErrorPage extends StatefulWidget {
  const PaginationErrorPage({super.key, required this.pagingController});
  final PagingController pagingController;

  @override
  State<PaginationErrorPage> createState() => _PaginationErrorPageState();
}

class _PaginationErrorPageState extends State<PaginationErrorPage> {
  bool showError = false;
  @override
  Widget build(BuildContext context) {
    assert(widget.pagingController.error is Failure);
    final failure = widget.pagingController.error as Failure;
    final type = failure.type;
    final message = failure.message;
    final code = failure.code;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Error retrieving data', style: context.bodyLarge),
        const Gap(10.0),
        FilledButton(
            onPressed: () => widget.pagingController.refresh(),
            child: const Text('   Retry   ')),
        const Gap(10.0),
        if (widget.pagingController.error is! Failure)
          Text(widget.pagingController.error.toString()),
        if (widget.pagingController.error is Failure)
          Column(
            children: [
              if (!showError)
                TextButton(
                    onPressed: () => setState(() => showError = !showError),
                    child: const Text('Error details')),
              if (showError)
                Column(
                  children: <Widget>[
                    if (type.isNotEmpty) Text('type: $type'),
                    if (message.isNotEmpty) Text('message : $message'),
                    if (code != null) Text('code : $code'),
                  ],
                ),
            ],
          )
      ],
    );
  }
}
