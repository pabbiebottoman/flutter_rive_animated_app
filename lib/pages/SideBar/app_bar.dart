// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:rive_animated_app/providers/globals.dart';
import '../../constant/colors.dart';

class SideBarAppBar extends ConsumerStatefulWidget {
  final double width;

  const SideBarAppBar({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  ConsumerState<SideBarAppBar> createState() => _SideBarAppBarState();
}

class _SideBarAppBarState extends ConsumerState<SideBarAppBar> {
  SMIBool? isOpen;

  bool get checkIfIsOpen => isOpen?.value ?? false;

  void onInit(Artboard artboard) {
    //Create and Init a new controller
    final controller = StateMachineController.fromArtboard(
        artboard, 'State Machine', onStateChange: (prevS, newS) {
      setState(() {});
    });
    //Link the controller to the Animation Artboard
    artboard.addController(controller!);
    //Make the controller global by attaching it to the LS controller.
    isOpen = controller.findInput<bool>('isOpen') as SMIBool;

    isOpen!.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(right: widget.width * 0.3, top: 30),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColor.primary,
                  child: Icon(
                    CupertinoIcons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Pabbie Bottoman',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Developer',
                      style: TextStyle(
                        color: AppColor.subtitle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // const MenuSideBarButton()
            InkWell(
              onTap: () {
                isOpen?.value = true;
                ref.read(sideBarProvider.notifier).state = false;

                Future.delayed(const Duration(milliseconds: 1600), () {
                  isOpen?.value = false;
                });
              },
              child: Hero(
                tag: '__Icon__',
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: RiveAnimation.asset(
                      'assets/RiveAssets/menu_button.riv',
                      fit: BoxFit.cover,
                      artboard: 'menu',
                      onInit: onInit,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
