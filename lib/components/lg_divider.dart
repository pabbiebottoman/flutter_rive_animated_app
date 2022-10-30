import 'package:flutter/material.dart';

class LinearGradientDivider extends StatelessWidget {
  final Color begin, end;

  const LinearGradientDivider({
    super.key,
    required this.begin,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [begin, end],
            )),
      ),
    );
  }
}
