import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';

class SignInMedusaLogo extends StatefulWidget {
  const SignInMedusaLogo({super.key, this.rotate = false});

  final bool rotate;

  @override
  State<SignInMedusaLogo> createState() => _SignInMedusaLogoState();
}

class _SignInMedusaLogoState extends State<SignInMedusaLogo>
    with TickerProviderStateMixin {
  // Create a controller
  late AnimationController _controller;

  // Create an animation with value of type "double"
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
    if (widget.rotate) {
      _controller.repeat();
    } else {
      _controller.stop();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SignInMedusaLogo oldWidget) {
    if (oldWidget.rotate != widget.rotate) {
      if (widget.rotate) {
        _controller.repeat();
      } else {
        // _controller.value = 0;
        _controller.forward();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: SvgPicture.asset(
        context.isDark
            ? 'assets/images/medusa-logo-light.svg'
            : 'assets/images/medusa-logo-dark.svg',
        // width: 150,
        height: 180,
      ),
      // Image.asset(
      //   context.isDark
      //       ? 'assets/images/medusa-icon-light.png'
      //       : 'assets/images/medusa-icon-dark.png',
      //   // scale: 5,
      // ),
    );
  }
}
