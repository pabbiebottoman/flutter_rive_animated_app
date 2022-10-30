import 'dart:ui';

import 'package:rive_animated_app/model/course.dart';

class Courses {
  static List<Course> data = [
    Course(
      title: "Animations\nin SwiftUI",
      subtitle: "Build and animate an iOS app from scratch",
      caption: "20 sections - 3 hours",
      image: "assets/icons/ios.png",
      colors: [const Color(0xFF7850F0), const Color(0xFFC0AFFF)],
    ),
    Course(
      title: "Build Quick\nApps with SwiftUI",
      subtitle:
          "Apply your Swift and SwiftUI knowledge by building real, quick and various applications from scratch",
      caption: "47 sections - 11 hours",
      image: "assets/icons/code.png",
      colors: [const Color(0xFF6792FF), const Color(0xFFB1C7FF)],
    ),
    Course(
      title: "Build a\nSwiftUI app\nfor iOS 15",
      subtitle:
          "Design and code a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more",
      caption: "21 sections - 4 hours",
      image: "assets/icons/ios.png",
      colors: [const Color(0xFF005FE7), const Color(0xFF619AED)],
    ),
  ];
}
