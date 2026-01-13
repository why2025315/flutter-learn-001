import 'package:flutter/material.dart';
import 'package:flutter_demo001/data/notifiers.dart';
import 'package:flutter_demo001/widgets/hero_widget.dart';

import '../../data/constants.dart';
import '../../widgets/container_widget.dart';
import 'course_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterNotifier counterNotifier = CounterNotifier();
  List<String> list = [
    KValue.basicLayout,
    KValue.cleanUi,
    KValue.fixBugs,
    KValue.keyConcepts,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10.0),
            HeroWidget(title: 'Home Page', nextPage: CoursePage()),
            SizedBox(height: 5.0),
            ListenableBuilder(
              listenable: counterNotifier,
              builder: (context, child) {
                return Text('counter: ${counterNotifier.count}');
              },
            ),
            FilledButton(
              onPressed: () {
                counterNotifier.increment();
              },
              child: Text('add ++'),
            ),
            ...List.generate(10, (index) {
              return ContainerWidget(
                title: list.elementAt(index % list.length),
                description: 'This is item $index',
              );
            }),
          ],
        ),
      ),
    );
  }
}
