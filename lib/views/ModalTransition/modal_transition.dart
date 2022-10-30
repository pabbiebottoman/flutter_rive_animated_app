import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive_animated_app/constant/colors.dart';
import 'package:rive_animated_app/views/ModalTransition/animated_background.dart';
import 'package:rive_animated_app/views/ModalTransition/content_view.dart';

class ModalTransition extends ConsumerStatefulWidget {
  const ModalTransition({super.key});

  @override
  ConsumerState<ModalTransition> createState() => _ModalTransitionState();
}

class _ModalTransitionState extends ConsumerState<ModalTransition> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height * 0.92,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 30)],
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: const [
          Positioned(
            left: 20,
            child: AnimatedBackground(),
          ),
          ContentView()
        ],
      ),
    );
  }
}
