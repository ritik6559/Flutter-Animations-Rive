import 'dart:math';

import 'package:animated_drawer/info_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blue[400]!,
                Colors.blue[800]!,
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
          ),
          SafeArea(
            child: Container(
              width: 250,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              "https://mighty.tools/mockmind-api/content/human/5.jpg"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Eren Jaeger",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: const [
                        InfoCard(
                          icon: Icons.home,
                          title: "Home",
                        ),
                        InfoCard(
                          icon: Icons.person,
                          title: "Profile",
                        ),
                        InfoCard(
                          icon: Icons.settings,
                          title: "Settings",
                        ),
                        InfoCard(
                          icon: Icons.logout,
                          title: "Log out",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          //Main screen
          //we will wrap our main screen in a tween animation builder.
          //which will allows us to animate it.
          TweenAnimationBuilder(
            curve: Curves.easeIn,
            tween: Tween<double>(begin: 0, end: value),
            duration: const Duration(milliseconds: 500),
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3,
                      200 * val) //this will allow us to translate the screen.
                  ..rotateY((pi / 6) * val),
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text("3D Drawer menu"),
                  ),
                  body: const Center(
                    child: Text("Swipe right to open menu"),
                  ),
                ),
              ));
            },
          ),
          //gesture detector that will allow us to open the drawer
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          )
        ],
      ),
    );
  }
}
