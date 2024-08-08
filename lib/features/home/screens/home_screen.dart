import 'package:animated_drawer/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: backgroundColor2.withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: backgroundColor2.withOpacity(0.3),
              offset: const Offset(0, 20),
              blurRadius: 20,
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              SizedBox(
                height: 36,
                width: 36,
                child: RiveAnimation.asset(
                  'assets/RiveAssets/icons.riv',
                  artboard: "HOME",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
