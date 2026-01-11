import 'package:flutter/material.dart';

import '../../widgets/hero_widget.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('course-page')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [HeroWidget(title: 'Course Page')]),
        ),
      ),
    );
  }
}
