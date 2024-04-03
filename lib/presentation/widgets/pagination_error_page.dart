import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class PaginationErrorPage extends StatefulWidget {
  const PaginationErrorPage(
      {super.key, required this.pagingController, this.onRetry});
  final PagingController pagingController;
  final void Function()? onRetry;

  @override
  State<PaginationErrorPage> createState() => _PaginationErrorPageState();
}

class _PaginationErrorPageState extends State<PaginationErrorPage> {
  @override
  void initState() {
    if (widget.pagingController.error is Failure &&
        (widget.pagingController.error as Failure).code == 401) {
      context.router.reevaluateGuards();
    }
    super.initState();
  }

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
            onPressed: widget.onRetry ??
                () async {
                  widget.pagingController.refresh();
                },
            child: const Text('   Retry   ')),
        const Gap(10.0),
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
