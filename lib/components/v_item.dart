import 'package:flutter/material.dart';

import '../constant/colors.dart';

class VItem extends StatelessWidget {
  final Color color;
  final String title, subtitle, image;

  const VItem({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.all(22),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins Bold',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColor.subtitle,
                  fontFamily: 'Inter',
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Image.asset(image, height: 40)
        ],
      ),
    );
  }
}
