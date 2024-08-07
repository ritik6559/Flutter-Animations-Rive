import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const InfoCard({
    super.key,
    required this.icon, 
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
