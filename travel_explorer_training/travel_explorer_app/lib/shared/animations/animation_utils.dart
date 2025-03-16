import 'package:flutter/material.dart';

/// 1. AnimationController & CurvedAnimation demonstration
class FadeSlideTransition extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Offset beginOffset;
  final bool forward;

  const FadeSlideTransition({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.beginOffset = const Offset(0.2, 0.0),
    this.forward = true,
  });

  @override
  State<FadeSlideTransition> createState() => _FadeSlideTransitionState();
}

class _FadeSlideTransitionState extends State<FadeSlideTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    
    // Create animation controller
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    
    // Create curved animation for smoother effect
    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    
    // Create animations using Tweens
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(curvedAnimation);
    
    _slideAnimation = Tween<Offset>(
      begin: widget.beginOffset,
      end: Offset.zero,
    ).animate(curvedAnimation);
    
    // Start animation based on direction
    if (widget.forward) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(FadeSlideTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // Handle changes to animation direction
    if (widget.forward != oldWidget.forward) {
      if (widget.forward) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Tween & AnimatedBuilder demonstration
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: SlideTransition(
            position: _slideAnimation,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

/// 2. Custom AnimatedWidget demonstration
class PulseAnimation extends AnimatedWidget {
  final Widget child;
  final Color pulseColor;
  
  const PulseAnimation({
    super.key,
    required Animation<double> animation,
    required this.child,
    this.pulseColor = Colors.blue,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: pulseColor.withOpacity(0.5 * animation.value),
            blurRadius: 10.0 * animation.value,
            spreadRadius: 2.0 * animation.value,
          ),
        ],
      ),
      child: child,
    );
  }
}

/// Helper widget that uses the AnimatedWidget
class PulsingWidget extends StatefulWidget {
  final Widget child;
  final Color pulseColor;
  final Duration duration;
  
  const PulsingWidget({
    super.key,
    required this.child,
    this.pulseColor = Colors.blue,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<PulsingWidget> createState() => _PulsingWidgetState();
}

class _PulsingWidgetState extends State<PulsingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    
    _animation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    
    // Create repeating animation
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PulseAnimation(
      animation: _animation,
      pulseColor: widget.pulseColor,
      child: widget.child,
    );
  }
}

/// 3. Animation Notification example
class AnimationProgressNotification extends Notification {
  final double progress;
  final String animationId;
  
  AnimationProgressNotification(this.progress, {this.animationId = 'default'});
}

/// Widget that tracks animation progress and notifies parent
class AnimationProgressTracker extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final VoidCallback? onComplete;
  final String animationId;
  
  const AnimationProgressTracker({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.onComplete,
    this.animationId = 'default',
  });

  @override
  State<AnimationProgressTracker> createState() => _AnimationProgressTrackerState();
}

class _AnimationProgressTrackerState extends State<AnimationProgressTracker>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    
    _controller.addListener(_notifyProgress);
    _controller.addStatusListener(_handleStatusChange);
    
    _controller.forward();
  }
  
  void _notifyProgress() {
    AnimationProgressNotification(
      _controller.value,
      animationId: widget.animationId,
    ).dispatch(context);
  }
  
  void _handleStatusChange(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onComplete?.call();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_notifyProgress);
    _controller.removeStatusListener(_handleStatusChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

/// Widget that listens for animation progress
class AnimationProgressListener extends StatefulWidget {
  final Widget Function(BuildContext context, double progress) builder;
  final String animationId;
  
  const AnimationProgressListener({
    super.key,
    required this.builder,
    this.animationId = 'default',
  });

  @override
  State<AnimationProgressListener> createState() => _AnimationProgressListenerState();
}

class _AnimationProgressListenerState extends State<AnimationProgressListener> {
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<AnimationProgressNotification>(
      onNotification: (notification) {
        if (notification.animationId == widget.animationId) {
          setState(() {
            _progress = notification.progress;
          });
        }
        return true;
      },
      child: widget.builder(context, _progress),
    );
  }
}