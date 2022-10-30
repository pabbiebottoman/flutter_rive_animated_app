import 'dart:ui';

import 'package:rive_animated_app/model/recent.dart';

class Recents {
  static List<Recent> data = [
    Recent(
      title: "State Machine",
      subtitle: "Watch video - 15 mins",
      image: "assets/icons/code.png",
      color: const Color(0xFF9CC5FF),
    ),
    Recent(
      title: "Animated Menu",
      subtitle: "Watch video - 10 mins",
      image: "assets/icons/ios.png",
      color: const Color(0xFF6E6AE8),
    ),
    Recent(
      title: "Tab Bar",
      subtitle: "Watch video - 8 mins",
      image: "assets/icons/code.png",
      color: const Color(0xFF005FE7),
    ),
    Recent(
      title: "Button",
      subtitle: "Watch video - 9 mins",
      image: "assets/icons/ios.png",
      color: const Color(0xFFBBA6FF),
    ),
  ];
}
