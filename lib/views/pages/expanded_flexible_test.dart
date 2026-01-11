import 'package:flutter/material.dart';

class ExpandedFlexibleTest extends StatelessWidget {
  const ExpandedFlexibleTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Text('Hello'),
                  color: Colors.blue,
                  height: 20.0,
                ),
              ),
              Flexible(
                child: Container(
                  child: Text('Hello'),
                  color: Colors.yellow,
                  height: 20.0,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Flexible(
                child: Container(
                  child: Text('Hello'),
                  color: Colors.yellow,
                  height: 20.0,
                ),
              ),
              Expanded(
                child: Container(
                  child: Text('Hello'),
                  color: Colors.blue,
                  height: 20.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
