import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollingExpandableFab extends StatefulWidget {
  const ScrollingExpandableFab({
    Key? key,
    required this.controller,
    required this.label,
    required this.icon,
    this.onPressed,
    this.animDuration = const Duration(milliseconds: 350),
    this.labelStyle,
    this.expandOnTopOnly = true, this.heroTag,
  }) : super(key: key);

  final ScrollController controller;

  final String label;

  final bool expandOnTopOnly;

  final Widget icon;

  final VoidCallback? onPressed;

  final Duration animDuration;

  final TextStyle? labelStyle;

  final Object? heroTag;

  @override
  State<ScrollingExpandableFab> createState() => _ScrollingExpandableFabState();
}

class _ScrollingExpandableFabState extends State<ScrollingExpandableFab> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.animDuration,
    vsync: this,
  );

  late final Animation<double> _anim =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

  double lastReverseScrollPosition = 0.0;
  double lastForwardScrollPosition = 0.0;

  ScrollController get _scrollController => widget.controller;

  _scrollListener() {
    final scrollPosition = _scrollController.position.pixels;
    final scrollDirection = _scrollController.position.userScrollDirection;

    switch (scrollDirection) {
      case ScrollDirection.idle:
        return;
      case ScrollDirection.forward:
        lastForwardScrollPosition = 0.0;

        if (widget.expandOnTopOnly) {
          if (_scrollController.position.pixels < 100) {
            if (!_controller.isAnimating) {
              _controller.reverse();
            }
          }
          return;
        }

        if (lastReverseScrollPosition == 0.0) {
          lastReverseScrollPosition = scrollPosition;
        }
        if ((lastReverseScrollPosition - scrollPosition) > 300) {
          if (!_controller.isAnimating) {
            _controller.reverse();
          }
        }
        return;
      case ScrollDirection.reverse:
        lastReverseScrollPosition = 0.0;
        if (lastForwardScrollPosition == 0.0) {
          lastForwardScrollPosition = scrollPosition;
        }
        if ((lastForwardScrollPosition - scrollPosition).abs() > 300) {
          if (!_controller.isAnimating) {
            _controller.forward();
          }
        }
        return;
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.heroTag == null){
      return FloatingActionButton.extended(
        icon: widget.icon,
        onPressed: widget.onPressed,
        extendedIconLabelSpacing: 0,
        extendedPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        label: AnimatedBuilder(
          animation: _anim,
          builder: (context, child) {
            return ClipRect(
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                widthFactor: 1 - _anim.value,
                child: Opacity(
                  opacity: 1 - _anim.value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(widget.label, style: widget.labelStyle),
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return FloatingActionButton.extended(
        heroTag: widget.heroTag,
        icon: widget.icon,
        onPressed: widget.onPressed,
        extendedIconLabelSpacing: 0,
        extendedPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        label: AnimatedBuilder(
          animation: _anim,
          builder: (context, child) {
            return ClipRect(
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                widthFactor: 1 - _anim.value,
                child: Opacity(
                  opacity: 1 - _anim.value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(widget.label, style: widget.labelStyle),
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
