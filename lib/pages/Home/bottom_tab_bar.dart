import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:rive_animated_app/providers/globals.dart';
import '../../constant/colors.dart';
import 'tabbar_utils.dart';

class BottomTabBar extends ConsumerStatefulWidget {
  const BottomTabBar({super.key});

  @override
  ConsumerState<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends ConsumerState<BottomTabBar> {
  @override
  void initState() {
    for (int index = 0; index < TabBarUtils.items.length; index++) {
      TabBarUtils.items[index]['controller'] =
          OneShotAnimation('active', mix: 1, autoplay: false);
    }
    super.initState();
  }

  @override
  void dispose() {
    for (int index = 0; index < TabBarUtils.items.length; index++) {
      TabBarUtils.items[index]['controller'].dispose();
    }
    super.dispose();
  }

  RiveAnimation item(int index) {
    return RiveAnimation.asset(
      'assets/RiveAssets/icons.riv',
      alignment: Alignment.center,
      animations: const ['active', 'idle'],
      antialiasing: false,
      artboard: TabBarUtils.items[index]['artboard'],
      stateMachines: [TabBarUtils.items[index]['stateMachine']!],
      controllers: [TabBarUtils.items[index]['controller']],
      onInit: (artboard) => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sideBarProvider);
    final activeIndex = ref.watch(tabBarItemIndexProvider);

    return SafeArea(
      bottom: true,
      child: AnimatedContainer(
        height: 65,
        alignment: Alignment.center,
        transformAlignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        duration: const Duration(milliseconds: 550),
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        transform: Matrix4.identity()
          ..translate(0.0, state == true ? 175.0 : 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            TabBarUtils.items.length,
            (index) => GestureDetector(
              onTap: () {
                ref.read(tabBarItemIndexProvider.notifier).state = index;
                TabBarUtils.items[index]['controller'].isActive = true;

                Future.delayed(
                  const Duration(milliseconds: 2000),
                  () => TabBarUtils.items[index]['controller'].isActive = false,
                );
              },
              child: Column(
                children: [
                  AnimatedOpacity(
                    opacity: activeIndex == index ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOutBack,
                    child: Container(
                      height: 5,
                      width: 30,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColor.highlight,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  Container(
                    height: 36,
                    width: 36,
                    clipBehavior: Clip.none,
                    child: item(index),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
