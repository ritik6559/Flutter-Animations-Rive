import 'package:animated_drawer/features/home/screens/entry_point/components/animated_bar.dart';
import 'package:animated_drawer/models/menu.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BtmNavItem extends StatelessWidget {
  final Menu navBar;
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final Menu selectedNav;
  const BtmNavItem({
    super.key,
    required this.navBar,
    required this.press,
    required this.riveOnInit,
    required this.selectedNav,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBar(isActive: selectedNav == navBar),
          SizedBox(
            height: 36,
            width: 36,
            child: Opacity(
              opacity: selectedNav == navBar ? 1 : 0.5,
              child: RiveAnimation.asset(
                navBar.rive.src,
                artboard: navBar.rive.artboard,
                onInit: riveOnInit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
