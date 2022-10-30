import 'package:flutter_riverpod/flutter_riverpod.dart';

final sideBarProvider = StateProvider<bool>((ref) {
  return false;
});

final modalTransitionProvider = StateProvider<bool>((ref) {
  return false;
});

final sideBarItemIndexProvider = StateProvider<int>((ref) {
  return 0;
});

final tabBarItemIndexProvider = StateProvider<int>((ref) {
  return 0;
});
