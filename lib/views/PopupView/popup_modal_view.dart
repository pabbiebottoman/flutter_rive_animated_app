import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animated_app/components/lg_divider.dart';
import 'package:rive_animated_app/views/PopupView/spring_popup_button.dart';
import 'package:rive_animated_app/views/PopupView/texts.dart';
import 'popup_pop_button.dart';
import 'text_field_widget.dart';

class PopupModalView extends StatefulWidget {
  const PopupModalView({super.key});

  @override
  State<PopupModalView> createState() => _PopupModalViewState();
}

class _PopupModalViewState extends State<PopupModalView> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  SMIInput<bool>? checkController, errorController, resetController;

  bool get check => checkController?.value ?? false;
  bool get error => errorController?.value ?? false;
  bool get reset => resetController?.value ?? false;

  bool showErrorCheck = false; //Controls the animation overlay.

  onInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
        artboard, 'State Machine 1', onStateChange: (preV, neW) {
      debugPrint('changed from $preV to $neW');
    });

    artboard.addController(controller!);

    checkController = controller.findInput('Check');
    errorController = controller.findInput('Error');
    resetController = controller.findInput('Reset');
  }

  void onButtonTap() {
    setState(() => showErrorCheck = true);
    //We need to check if the TEF isNull of !isNull;
    //ShowCheckError Duration is 500 mills.
    //Thus we delay until 500 mills before the check is init.
    Future.delayed(const Duration(milliseconds: 500), () {
      if (emailController.value.text.isEmpty) {
        errorController?.value = true;
      } else {
        //If !isNull we show the check animation.
        checkController?.value = true;
      }
    });

    ///When done, we [delay] the resetting of state to true
    ///then the other values to [false];
    Future.delayed(const Duration(milliseconds: 3500), () {
      ///This reset value sets every [controller.value] to false.
      resetController?.value = true;
    }).timeout(const Duration(milliseconds: 3200), onTimeout: () {
      setState(() => showErrorCheck = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                height: height * 0.75,
                width: width * 0.9,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(180),
                ),
                child: Column(
                  children: [
                    SignInText,
                    const SizedBox(height: 20),
                    PopupDescriptionText,
                    TextFieldWidget(
                      controller: emailController,
                      headerText: EmailText,
                      prefixImg: 'assets/icons/email.png',
                    ),
                    TextFieldWidget(
                      controller: passwordController,
                      headerText: PasswordText,
                      prefixImg: 'assets/icons/lock.png',
                    ),
                    SpringPopupButton(onTap: onButtonTap),
                    Row(children: const [
                      LinearGradientDivider(
                          begin: Color(0xFFBDBDBD), end: Color(0xFFE0E0E0)),
                      ORText,
                      LinearGradientDivider(
                          end: Color(0xFFBDBDBD), begin: Color(0xFFE0E0E0)),
                    ]),
                    //Bottom View
                    Column(
                      children: [
                        FooterText,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/icons/emailBlack.png'),
                            Image.asset('assets/icons/apple.png'),
                            Image.asset('assets/icons/google.png'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            height: 120,
            width: 120,
            child: AnimatedOpacity(
              opacity: showErrorCheck ? 1.0 : 0.01,
              curve: Curves.easeInOutBack,
              duration: const Duration(milliseconds: 500),
              child: RiveAnimation.asset(
                'assets/RiveAssets/check.riv',
                fit: BoxFit.cover,
                artboard: 'check_artboard',
                onInit: onInit,
              ),
            ),
          ),
          Positioned(
            bottom: -20.0,
            child: PopupPopButton(onTap: () => Navigator.pop(context)),
          ),
        ],
      ),
    );
  }
}
