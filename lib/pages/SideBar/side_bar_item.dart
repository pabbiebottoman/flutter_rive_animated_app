import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../constant/colors.dart';
import 'utils.dart';

class SideBarItem extends StatefulWidget {
  final VoidCallback onTap;
  final int activeIndex;
  final int index;

  const SideBarItem({
    super.key,
    required this.onTap,
    required this.activeIndex,
    required this.index,
  });

  @override
  State<SideBarItem> createState() => _SideBarItemState();
}

class _SideBarItemState extends State<SideBarItem>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController animationController;
  late final Animation<double> colorAnimation;
  late final Animation<AlignmentGeometry> alignmentAnimation;

  @override
  void initState() {
    const Duration duration = Duration(milliseconds: 350);

    for (int index = 0; index < SideBarUtil.items.length; index++) {
      SideBarUtil.items[index]['controller'] =
          OneShotAnimation('active', mix: 1, autoplay: false);
    }

    animationController = AnimationController(
      vsync: this,
      duration: duration,
      reverseDuration: duration,
    );

    colorAnimation =
        Tween<double>(begin: -300.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.0, 1.0, curve: Curves.easeIn),
    ));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    for (int index = 0; index < SideBarUtil.items.length; index++) {
      SideBarUtil.items[index]['controller'].dispose();
    }
    super.dispose();
  }

  @override
  //We are calling the animation on once on every tap of the tile.
  bool get wantKeepAlive => false;

  RiveAnimation item(int index) {
    return RiveAnimation.asset(
      'assets/RiveAssets/icons.riv',
      alignment: Alignment.center,
      animations: const ['active', 'idle'],
      antialiasing: false,
      artboard: SideBarUtil.items[index]['artboard'],
      stateMachines: [SideBarUtil.items[index]['stateMachine']],
      controllers: [SideBarUtil.items[index]['controller']],
      onInit: (artboard) => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (widget.activeIndex == widget.index) {
      //We call the animation immediately when the tile is tapped.
      animationController.forward();
    } else {
      animationController.reverse();
    }

    return GestureDetector(
      onTap:widget.onTap,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                // Rive(artboard: Artboard()),
                Container(
                  height: 45,
                  color: AppColor.highlight,
                  transform: Matrix4.identity()
                    ..translate(colorAnimation.value),
                ),
                Container(
                  height: 45,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: item(widget.index),
                      ),
                      // Icon(widget.items[widget.index]['icon'],
                      //     color: AppColor.subtitle),
                      const SizedBox(width: 8),
                      Text(
                        SideBarUtil.items[widget.index]['label']!,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
