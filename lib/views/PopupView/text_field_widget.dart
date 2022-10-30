import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String prefixImg;
  final Widget headerText;
  final TextEditingController controller;

  const TextFieldWidget({
    Key? key,
    required this.prefixImg,
    required this.headerText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18),
        headerText,
        const SizedBox(height: 5.0),
        CupertinoTextField(
          controller: controller,
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(prefixImg),
          ),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFACACAC)),
            borderRadius: BorderRadius.circular(10.0),
          ),
        )
      ],
    );
  }
}
