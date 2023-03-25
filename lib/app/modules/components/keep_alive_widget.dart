import 'package:flutter/material.dart';

class KeepAliveWidget extends StatefulWidget {
  const KeepAliveWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  State<KeepAliveWidget> createState() => _KeepAliveWidgetState();
}

class _KeepAliveWidgetState extends State<KeepAliveWidget> with AutomaticKeepAliveClientMixin<KeepAliveWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
