import 'package:flutter/material.dart';

class Bounce extends StatefulWidget {
  final VoidCallback? onTap;

  final Widget child;
  final Duration duration;
  final bool haptic;

  const Bounce({
    Key? key,
    this.onTap,
    this.haptic = true,
    required this.child,
    this.duration = const Duration(milliseconds: 130),
  }) : super(key: key);

  @override
  State<Bounce> createState() => _BounceState();
}

class _BounceState extends State<Bounce> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
    value: 1.0,
    upperBound: 1.0,
    lowerBound: 0.97,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );
  late final AnimationController _controller1 = AnimationController(
    vsync: this,
    duration: widget.duration,
    value: 1.0,
    upperBound: 1.0,
    lowerBound: 0.6,
  );

  late final Animation<double> _animation1 = CurvedAnimation(
    parent: _controller1,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    super.dispose();
  }

  void _onTap() async {
    if (widget.onTap != null) {
      widget.onTap!();

      await _controller.reverse();
      _controller1.reverse();
      _controller.forward();
      _controller1.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.onTap != null) {
      _controller.forward();
      _controller1.forward();
    }
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.onTap != null) {
      _controller.reverse();
      _controller1.reverse();
      if (widget.haptic) {}
    }
  }

  void _onTapCancel() {
    if (widget.onTap != null) {
      _controller.forward();
      _controller1.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: GestureDetector(
        onTapCancel: _onTapCancel,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTap: _onTap,
        child: FadeTransition(
          opacity: _animation1,
          child: ScaleTransition(
            scale: _animation,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
