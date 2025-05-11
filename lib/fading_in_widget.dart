library fading_in_widget;

import 'package:flutter/material.dart';

class FadingInWidget extends StatefulWidget {
  const FadingInWidget({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.delay = Duration.zero,
    this.curve = Curves.easeInOut,
  });

  /// The child widget to be displayed
  final Widget child;

  /// Duration of the animation
  final Duration duration;

  /// Waiting time before the animation starts
  final Duration delay;

  /// Curve of the animation
  final Curve curve;

  @override
  State<FadingInWidget> createState() => FadingInWidgetState();
}

class FadingInWidgetState extends State<FadingInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    forward();
  }

  void forward() async {
    await Future.delayed(widget.delay);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
