import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:rive_animated_app/views/PopupView/popup_modal_view.dart';
import '../../providers/globals.dart';
import 'modal_pop_button.dart';
import 'spring_modal_button.dart';
import 'texts.dart';

class ContentView extends StatelessWidget {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final topSA = MediaQuery.of(context).padding.top;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 25),
        child: Consumer(builder: (context, ref, child) {
          return Container(
            padding: EdgeInsets.only(top: topSA),
            color: Colors.white54.withAlpha(100),
            child: Stack(
              children: [
                //End Icon
                Positioned(
                  top: 40,
                  right: 15,
                  child: ModalPopButton(
                    onTap: () {
                      ref.read(modalTransitionProvider.notifier).state = false;
                    },
                  ),
                ),

                //Top View Texts
                Positioned(
                  top: 30,
                  left: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [HeaderText, DescriptionText],
                  ),
                ),

                //Bottom View
                Positioned(
                  bottom: 30,
                  left: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpringButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoModalPopupRoute(
                              barrierColor: Colors.black26,
                              builder: (context) => const PopupModalView(),
                            ),
                          );
                        },
                      ),
                      FooterText
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
