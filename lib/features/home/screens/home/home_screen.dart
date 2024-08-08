import 'package:animated_drawer/features/home/screens/home/components/course_card.dart';
import 'package:animated_drawer/features/home/screens/home/components/secondary_courses_card.dart';
import 'package:animated_drawer/models/course.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Courses",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: courses
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: CourseCard(
                            title: e.title,
                            iconSrc: e.iconSrc,
                            color: e.color,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Recent",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ...recentCourses.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: SecondaryCourseCard(
                    title: e.title,
                    iconsSrc: e.iconSrc,
                    colorl: e.color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
