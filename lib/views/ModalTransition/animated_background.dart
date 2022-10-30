import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive_animated_app/providers/globals.dart';

class AnimatedBackground extends ConsumerStatefulWidget {
  const AnimatedBackground({super.key});

  @override
  ConsumerState<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends ConsumerState<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  //
  late final AnimationController animationController;
  late final Animation<double> transX, transY, angleAnimation;

  @override
  void initState() {
    const duration = Duration(milliseconds: 2000);

    animationController = AnimationController(
      vsync: this,
      duration: duration,
      reverseDuration: duration,
    );

    transX = Tween<double>(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeIn)));

    transY = Tween<double>(begin: -30.0, end: 50.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOut)));

    angleAnimation =
        Tween<double>(begin: -45.0, end: 45.0).animate(animationController);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final modalState = ref.watch(modalTransitionProvider);

    if (modalState) {
      animationController.forward();
      animationController.repeat(reverse: true);
    } else if (modalState == false) {
      animationController.stop();
    }

    return AnimatedBuilder(
      animation: animationController,
      child: Image.asset(
        'assets/images/spline.png',
        fit: BoxFit.fitHeight,
        height: height * 0.7,
      ),
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            ..rotateY((math.pi / 180) * angleAnimation.value)
            ..translate(transX.value, transY.value),
          child: child,
        );
      },
    );
  }
}
