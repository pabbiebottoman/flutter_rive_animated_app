import 'package:flutter/material.dart';

class SpringButton extends StatefulWidget {
  final VoidCallback onTap;

  const SpringButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<SpringButton> createState() => _SpringButtonState();
}

class _SpringButtonState extends State<SpringButton> {
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
        margin: const EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(isPressed ? 18.0 : 0.0),
        height: 64,
        duration: const Duration(milliseconds: 100),
        curve: isPressed == true ? Curves.easeIn : Curves.easeOut,
        // transform: Matrix4.identity()..scale(isPressed == true ? 0.75 : 1.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 60,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.deepOrange.shade200,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(8),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 8,
              child: Container(
                // height: 45,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(color: Colors.black38, blurRadius: 10)
                    ]),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.arrow_forward, size: 25),
                    SizedBox(width: 8),
                    Text(
                      'Start the Course',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
