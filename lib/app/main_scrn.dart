import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:rive_animated_app/constant/colors.dart';
import 'package:rive_animated_app/views/ModalTransition/modal_transition.dart';

import '../pages/Home/home.dart';
import '../pages/SideBar/side_bar.dart';
import '../providers/globals.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  late final RiveAnimationController menuIconController;

  @override
  void initState() {
    menuIconController = OneShotAnimation('start', autoplay: false);
    super.initState();
  }

  @override
  void dispose() {
    menuIconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sideBarProvider);
    final modalState = ref.watch(modalTransitionProvider);
    final height = MediaQuery.of(context).size.height;
    const Duration duration = Duration(milliseconds: 600);

    if (state == true) {
      menuIconController.isActive = true;
    } else if (state == false) {
      menuIconController.isActive = false;
    } else {
      menuIconController.isActive = false;
    }

    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(color: AppColor.primaryDark),
        SideBar(menuIconController),
        AnimatedPadding(
          duration: duration,
          padding: EdgeInsets.only(
            bottom: modalState ? height * 0.06 : 0.0,
            left: modalState ? 20.0 : 0.0,
            right: modalState ? 20.0 : 0.0,
          ),
          child: HomePage(menuIconController),
        ),
        AnimatedContainer(
          duration: duration,
          curve: Curves.easeInOut,
          transform: Matrix4.identity()
            ..translate(0.0, modalState ? 0.0 : -height),
          child: const ModalTransition(),
        )
      ],
    );
  }
}
