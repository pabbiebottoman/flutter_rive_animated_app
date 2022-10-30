import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:rive_animated_app/components/texts.dart';
import 'package:rive_animated_app/constant/colors.dart';
import 'package:rive_animated_app/data/courses_data.dart';
import 'package:rive_animated_app/pages/Home/bottom_tab_bar.dart';
import '../../components/h_item.dart';
import '../../components/v_item.dart';
import '../../data/recents_data.dart';
import '../../providers/globals.dart';
import 'dart:math' as math;

import 'home_app_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  final RiveAnimationController riveAnimationController;
  const HomePage(this.riveAnimationController, {super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  ///
  late final AnimationController animationController;
  late final Animation<double> perspectiveAnimation;
  late final Animation<double> rotationAnimation;
  late final Animation<double> translationAnimation;

  @override
  void initState() {
    const Duration duration = Duration(milliseconds: 1000);

    animationController = AnimationController(
      vsync: this,
      duration: duration,
      reverseDuration: duration,
    );

    perspectiveAnimation = Tween<double>(begin: 0.001, end: 0.0025).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOutBack),
    );

    rotationAnimation = Tween<double>(begin: 0.0, end: 30).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOutBack),
    );

    translationAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOutBack),
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sideBarProvider);
    final modalState = ref.watch(modalTransitionProvider);
    final w = MediaQuery.of(context).size.width;

    if (state == true) {
      animationController.forward();
    } else if (state == false) {
      animationController.reverse();
    }

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, perspectiveAnimation.value)
            ..rotateY((math.pi / 180) * rotationAnimation.value)
            ..translate(w * translationAnimation.value),
          alignment: Alignment.centerRight,
          child: child,
        );
      },
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(35),
        child: IgnorePointer(
          ignoring: state == false ? false : true,
          child: Scaffold(
            backgroundColor: AppColor.background,
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(52),
              child: HomeAppBar(),
            ),
            body: SafeArea(
              child: ListView(
                key: const Key('__MainListView__'),
                primary: true,
                clipBehavior:
                    Clip.none, //Enables Transparency on AppBar and BottomAppBar
                padding: const EdgeInsets.all(20),
                physics: const BouncingScrollPhysics(),
                children: [
                  CoursesTitle(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    physics: const BouncingScrollPhysics(),
                    child: Wrap(
                      spacing: 20,
                      children: List.generate(Courses.data.length, (index) {
                        final course = Courses.data[index];

                        return HItem(
                          title: course.title,
                          subtitle: course.subtitle,
                          caption: course.caption,
                          image: course.image,
                          colors: course.colors,
                        );
                      }),
                    ),
                  ),
                  RecentsTitle(),
                  const SizedBox(height: 8),
                  AnimatedOpacity(
                    opacity: modalState ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: Wrap(
                      spacing: 20,
                      direction: Axis.vertical,
                      children: List.generate(
                        Recents.data.length,
                        (index) {
                          final recent = Recents.data[index];

                          return VItem(
                            title: recent.title,
                            subtitle: recent.subtitle,
                            image: recent.image,
                            color: recent.color,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: const BottomTabBar(),
          ),
        ),
      ),
    );
  }
}
