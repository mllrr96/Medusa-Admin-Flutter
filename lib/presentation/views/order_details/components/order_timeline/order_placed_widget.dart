import 'package:flutter/material.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

import '../../../../../../core/constant/colors.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';
import 'package:medusa_admin/core/extension/date_time_extension.dart';
class OrderPlacedWidget extends StatefulWidget {
  const OrderPlacedWidget(this.order, {super.key});

  final Order order;

  @override
  State<OrderPlacedWidget> createState() => _OrderPlacedWidgetState();
}

class _OrderPlacedWidgetState extends State<OrderPlacedWidget> {
  bool showTimeAgo = true;

  @override
  Widget build(BuildContext context) {
    final durationDiff = DateTime.now().difference(widget.order.createdAt ?? DateTime.now());
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final total = widget.order.total.formatAsPrice(widget.order.currencyCode);
    return InkWell(
      onTap: () {
        setState(() {
          showTimeAgo = !showTimeAgo;
        });
      },
      child: Column(
        children: [
          Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle_outline),
              const SizedBox(width: 12.0),
              Text('Order Placed', style: smallTextStyle),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.check_circle_outline, color: Colors.transparent),
              const SizedBox(width: 12.0),
              AnimatedCrossFade(
                firstChild: Text('${DateTime.now().subtract(durationDiff).timeAgo()} · $total',
                    style: smallTextStyle?.copyWith(color: manatee)),
                secondChild: Text(
                    '${widget.order.createdAt.formatDate()} ${widget.order.createdAt.formatTime()} · $total',
                    style: smallTextStyle?.copyWith(color: manatee)),
                crossFadeState: showTimeAgo ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
        ],
      ),
    );
  }
}
