import 'package:flutter/material.dart';

class SpringPopupButton extends StatefulWidget {
  final VoidCallback onTap;

  const SpringPopupButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<SpringPopupButton> createState() => _SpringPopupButtonState();
}

class _SpringPopupButtonState extends State<SpringPopupButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapUp: (details) => Future.delayed(const Duration(milliseconds: 150),
          () => setState(() => isPressed = false)),
      onTapDown: (details) {
        setState(() => isPressed = true);
      },
      onLongPressUp: () => Future.delayed(const Duration(milliseconds: 150),
          () => setState(() => isPressed = false)),
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 64,
        duration: const Duration(milliseconds: 100),
        curve: isPressed == true ? Curves.easeIn : Curves.easeOut,
        transform: Matrix4.identity()..scale(isPressed ? 0.8 : 1.0),
        transformAlignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.pink.shade200,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_forward, size: 25, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
