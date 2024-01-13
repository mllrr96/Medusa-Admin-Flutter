import 'package:flutter/material.dart';

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
    if(oldWidget.rotate != widget.rotate) {
      if (widget.rotate) {
        _controller.repeat();
      } else {
        _controller.value = 0;
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
      child: Image.asset(
        'assets/images/medusa.png',
        scale: 5,
      ),
    );
  }
}
