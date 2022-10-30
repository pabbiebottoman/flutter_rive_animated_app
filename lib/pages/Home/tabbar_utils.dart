import 'package:rive/rive.dart';

class TabBarUtils {
  static List<Map<String, dynamic>> items = [
    {
      'artboard': 'CHAT',
      'label': 'Help',
      'stateMachine': 'CHAT_interactivity',
      'controller': RiveAnimationController,
    },
    {
      'artboard': 'SEARCH',
      'label': 'Search',
      'stateMachine': 'SEARCH_interactivity',
      'controller': RiveAnimationController,
    },
    {
      'artboard': 'TIMER',
      'label': 'History',
      'stateMachine': 'TIMER_interactivity',
      'controller': RiveAnimationController,
    },
    {
      'artboard': 'BELL',
      'label': 'Notifications',
      'stateMachine': 'BELL_interactivity',
      'controller': RiveAnimationController,
    },
    {
      'artboard': 'USER',
      'label': 'User',
      'stateMachine': 'USER_interactivity',
      'controller': RiveAnimationController,
    },
  ];
}
