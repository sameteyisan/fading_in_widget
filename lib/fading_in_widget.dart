/// A customizable fade-in animation for any Flutter widget.
library fading_in_widget;

import 'package:flutter/material.dart';

/// Fades [child] into view once, after an optional [delay].
///
/// By default, the animation lasts two seconds and uses [Curves.easeInOut].
/// Provide a new [key] to replay the animation with fresh state.
class FadingInWidget extends StatefulWidget {
  /// Creates a widget that fades its [child] into view.
  const FadingInWidget({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.delay = Duration.zero,
    this.curve = Curves.easeInOut,
  });

  /// The widget to fade into view.
  final Widget child;

  /// How long the fade-in animation lasts. Defaults to two seconds.
  final Duration duration;

  /// How long to wait before starting the animation. Defaults to no delay.
  final Duration delay;

  /// The animation's rate of change over time. Defaults to [Curves.easeInOut].
  final Curve curve;

  @override
  State<FadingInWidget> createState() => FadingInWidgetState();
}

/// The animation state for [FadingInWidget].
class FadingInWidgetState extends State<FadingInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);

    forward();
  }

  /// Starts the fade-in animation after the configured delay.
  void forward() async {
    await Future<void>.delayed(widget.delay);
    if (!mounted) {
      return;
    }
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}
