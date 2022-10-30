import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupPopButton extends StatelessWidget {
  final VoidCallback onTap;

  const PopupPopButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 20,
                spreadRadius: 5.0,
                offset: Offset(0.0, 7.0),
              )
            ]),
        child: const Icon(CupertinoIcons.xmark, color: Colors.black),
      ),
    );
  }
}
