import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:rive_animated_app/constant/colors.dart';
import 'package:rive_animated_app/pages/SideBar/utils.dart';
import '../../providers/globals.dart';
import 'app_bar.dart';
import 'side_bar_item.dart';

class SideBar extends ConsumerStatefulWidget {
  final RiveAnimationController riveAnimationController;
  const SideBar(this.riveAnimationController, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SideBarState();
}

class _SideBarState extends ConsumerState<SideBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  Animation<double>? translationXAnimation;

  @override
  void initState() {
    const Duration duration = Duration(milliseconds: 900);

    animationController = AnimationController(
      vsync: this,
      duration: duration,
      reverseDuration: duration,
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    double width = MediaQuery.of(context).size.width;

    translationXAnimation ??=
        Tween<double>(begin: -(width * 0.7), end: 0.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOutBack),
    );

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sideBarProvider);
    final width = MediaQuery.of(context).size.width;
    final activeIndex = ref.read(sideBarItemIndexProvider);

    if (state == true) {
      animationController.forward();
    } else {
      animationController.reverse();
    }

    return AnimatedBuilder(
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(translationXAnimation!.value, 0.0),
          child: child,
        );
      },
      animation: animationController,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: SideBarAppBar(width: width),
        ),
        backgroundColor: AppColor.primaryDark,
        body: SafeArea(
          child: SizedBox(
            width: width * 0.7,
            // color: AppColor.blue,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'BROWSE',
                    style: TextStyle(
                      color: AppColor.subtitle,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(color: Colors.grey.shade700, height: 1.0),
                ListView.separated(
                  itemCount: SideBarUtil.items.length - 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) {
                    return Divider(color: Colors.grey.shade700, height: 1.0);
                  },
                  itemBuilder: (context, index) {
                    return SideBarItem(
                      activeIndex: activeIndex,
                      index: index,
                      onTap: () {
                        setState(() {
                          ref.read(sideBarItemIndexProvider.notifier).state =
                              index;

                          SideBarUtil.items[index]['controller'].isActive =
                              true;

                          Future.delayed(
                            const Duration(milliseconds: 2000),
                            () => SideBarUtil
                                .items[index]['controller'].isActive = false,
                          );
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'HISTORY',
                    style: TextStyle(
                      color: AppColor.subtitle,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(color: Colors.grey.shade700, height: 1.0),
                ListView.separated(
                  itemCount: SideBarUtil.items.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, index) {
                    if (index >= 0 && index <= 3) {
                      return const SizedBox.shrink();
                    }
                    return Divider(color: Colors.grey.shade700, height: 1.0);
                  },
                  itemBuilder: (context, index) {
                    if (index >= 0 && index <= 3) {
                      return const SizedBox.shrink();
                    }
                    return SideBarItem(
                      activeIndex: activeIndex,
                      index: index,
                      onTap: () {
                        setState(() {
                          ref.read(sideBarItemIndexProvider.notifier).state =
                              index;
                        });
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
