// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:rive/rive.dart';

// import '../providers/globals.dart';

// class MenuSideBarButton extends ConsumerStatefulWidget {
//   const MenuSideBarButton({super.key});

//   @override
//   ConsumerState<MenuSideBarButton> createState() => _MenuSideBarButtonState();
// }

// class _MenuSideBarButtonState extends ConsumerState<MenuSideBarButton> {
  // SMIBool? isOpen;

  // bool get checkIfIsOpen => isOpen?.value ?? true;

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(sideBarProvider);

//     return InkWell(
//       onTap: () {
//         if (checkIfIsOpen) {
//           isOpen?.value = false;
//           ref.read(sideBarProvider.notifier).state = true;
//         } else {
//           isOpen?.value = true;
//           ref.read(sideBarProvider.notifier).state = false;
//         }
//       },
//       child: Hero(
//         tag: '__Icon__',
//         child: CircleAvatar(
//           radius: state == true ? 20 : 30,
//           backgroundColor: Colors.white,
//           child: SizedBox(
//             width: 45,
//             height: 45,
//             child: RiveAnimation.asset(
//               'assets/RiveAssets/menu_button.riv',
//               fit: BoxFit.cover,
//               artboard: 'menu',
//               onInit: (Artboard artboard) {
//                 //Create and Init a new controller
//                 final controller = StateMachineController.fromArtboard(
//                     artboard, 'State Machine', onStateChange: (prevS, newS) {
//                   setState(() {});
//                 });
//                 //Link the controller to the Animation Artboard
//                 artboard.addController(controller!);
//                 //Make the controller global by attaching it to the LS controller.
//                 isOpen = controller.findInput<bool>('isOpen') as SMIBool;

//                 isOpen!.value = true;
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
