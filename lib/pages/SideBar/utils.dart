import 'package:rive/rive.dart';

class SideBarUtil {
  static List<Map<String, dynamic>> items = [
    {
      'artboard': 'HOME',
      'label': 'Home',
      'stateMachine': 'HOME_interactivity',
      'controller': RiveAnimationController,
    },
    {
      'artboard': 'SEARCH',
      'label': 'Search',
      'stateMachine': 'SEARCH_interactivity',
      'controller': RiveAnimationController,
    },
    {
      'artboard': 'LIKE/STAR',
      'label': 'Favorites',
      'stateMachine': 'STAR_interactivity',
      'controller': RiveAnimationController,
    },
    {
      'artboard': 'CHAT',
      'label': 'Help',
      'stateMachine': 'CHAT_interactivity',
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
  ];
}
