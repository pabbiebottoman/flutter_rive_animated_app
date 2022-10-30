import 'package:flutter/material.dart';

import '../constant/colors.dart';

class HItem extends StatelessWidget {
  final List<Color> colors;
  final String title, subtitle, caption, image;

  const HItem({
    super.key,
    required this.colors,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: 290 * 0.9,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: colors[0].withAlpha(120),
            blurRadius: 10.0,
            spreadRadius: 0.0,
            offset: const Offset(0.0, 10),
          )
        ],
      ),
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        fit: StackFit.passthrough,
        children: [
          Positioned(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColor.subtitle,
                  fontFamily: 'Poppins',
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                caption.toUpperCase(),
                style: const TextStyle(
                  color: AppColor.subtitle,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                ),
              ),
            ],
          )),
          Positioned(right: 0, child: Image.asset(image, height: 40)),
          Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset('assets/images/avatars.png', height: 45),
          ),
        ],
      ),
    );
  }
}
