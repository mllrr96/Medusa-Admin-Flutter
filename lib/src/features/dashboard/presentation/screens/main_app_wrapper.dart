import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainAppWrapper extends StatelessWidget {
  const MainAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}
