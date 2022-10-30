import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import '../../providers/globals.dart';

class HomeAppBar extends ConsumerStatefulWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends ConsumerState<HomeAppBar> {
  SMIBool? isOpen;

  bool get checkIfIsOpen => isOpen?.value ?? true;

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

    isOpen!.value = true;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sideBarProvider);

    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              isOpen?.value = false;
              ref.read(sideBarProvider.notifier).state = true;

              Future.delayed(const Duration(milliseconds: 1600), () {
                isOpen?.value = true;
              });
            },
            child: AnimatedOpacity(
              opacity: state == true ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 750),
              child: Hero(
                tag: '__Icon__',
                child: CircleAvatar(
                  radius: 30,
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
          ),
          InkWell(
            onTap: () {
              ref.read(modalTransitionProvider.notifier).state = true;
            },
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(CupertinoIcons.person, color: Colors.black, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
