import 'package:flutter/material.dart';

class SalesChannelActiveDot extends StatelessWidget {
  const SalesChannelActiveDot(this.disabled,{super.key});
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    Color circleColor = Colors.green;
    Color haloColor = Colors.green;
    if (disabled) {
      circleColor = Colors.grey;
      haloColor = Colors.grey;
    }

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Icon(Icons.circle, color: circleColor, size: 10),
        Icon(Icons.circle, color: haloColor.withOpacity(0.17), size: 24),
      ],
    );
  }
}
