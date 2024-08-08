import 'package:animated_drawer/constants/constants.dart';
import 'package:animated_drawer/features/home/screens/entry_point/components/btm_nav_item.dart';
import 'package:animated_drawer/features/home/screens/entry_point/components/side_bar.dart';
import 'package:animated_drawer/features/home/screens/home/home_screen.dart';
import 'package:animated_drawer/models/menu.dart';
import 'package:animated_drawer/utils/rive_utils.dart';
import 'package:flutter/material.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {

  bool isSideBarOpen = false;
  Menu selectedBottomNav = bottomNavItems.first;

  void updateSelectedBtmBav(Menu menu) {
    if (selectedBottomNav != menu) {
      setState(() {
        selectedBottomNav = menu;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor2,
      body: Stack(
        children: [
          AnimatedPositioned(
            width: 288,
            height: MediaQuery.of(context).size.height,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 0 : -288,
            top: 0,
            child: const SideBar(),
          ),
          const HomeScreen(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding:
              const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
          margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                bottomNavItems.length,
                (index) {
                  Menu navBar = bottomNavItems[index];
                  return BtmNavItem(
                    navBar: navBar,
                    press: () {
                      RiveUtils.chnageSMIBoolState(navBar.rive.status!);
                      updateSelectedBtmBav(navBar);
                    },
                    riveOnInit: (artboard) {
                      navBar.rive.status = RiveUtils.getRiveInput(
                        artboard,
                        stateMachineName: navBar.rive.stateMachineName,
                      );
                    },
                    selectedNav: selectedBottomNav,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
