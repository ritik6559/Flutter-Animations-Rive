import 'dart:ui';

import 'package:animated_drawer/features/onBoarding/widgets/animated_button.dart';
import 'package:animated_drawer/features/onBoarding/widgets/sign_in_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    super.initState();
    _btnAnimationController = OneShotAnimation("active",
        autoplay:
            false //we are doing this so that it does not show animation every time we restart.
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 170,
            child: Image.asset(
              'assets/background/Spline.png',
            ),
          ),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          //adding blur effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 30,
                sigmaY: 30,
              ),
              child: const SizedBox(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        Text(
                          "Learn design & code",
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 2),
                  AnimatedButton(
                    onTap: () {
                      _btnAnimationController.isActive = true;
                      showGeneralDialog(
                        barrierLabel: "Sign In",
                        barrierDismissible:
                            true, //on tapping outside the dialog to close it.
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return Center(
                            child: Container(
                              height: 670,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 32, horizontal: 24),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.95),
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: const Offset(0, 30),
                                    blurRadius: 60,
                                  ),
                                  const BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(0, 30),
                                    blurRadius: 60,
                                  ),
                                ],
                              ),
                              child: const Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Column(
                                  children: [
                                    Text(
                                      "Sign In",
                                      style: TextStyle(
                                        fontSize: 34,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      child: Text(
                                        "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SignInForm(),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    riveAnimationController: _btnAnimationController,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                        "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
