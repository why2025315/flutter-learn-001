import 'package:flutter/material.dart';
import 'package:flutter_demo001/utils/toast_util.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key, required this.title});

  final String title;

  @override
  State<SettingPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<SettingPage> {
  TextEditingController usernameController = TextEditingController();
  bool? isChecked = false;
  bool isHot = false;
  double sliderValue = 0;
  int? dropdownValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // leading: BackButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        // automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(
                value: dropdownValue,
                items: [
                  DropdownMenuItem(value: 1, child: Text('Element 1')),
                  DropdownMenuItem(value: 2, child: Text('Element 2')),
                  DropdownMenuItem(value: 3, child: Text('Element 3')),
                ],
                onChanged: (int? value) {
                  setState(() {
                    dropdownValue = value;
                  });
                },
              ),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: 'username',
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              Text(usernameController.text),
              Checkbox(
                tristate: true,
                value: isChecked,
                semanticLabel: "复选框",
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              CheckboxListTile(
                tristate: true,
                value: isChecked,
                title: Text('男女'),
                subtitle: Text('请选择性别'),
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              Switch(
                value: isHot,
                onChanged: (value) {
                  setState(() {
                    isHot = value;
                  });
                },
              ),
              SwitchListTile.adaptive(
                value: isHot,
                title: Text('天气是否很热'),
                onChanged: (value) => setState(() {
                  isHot = value;
                }),
              ),
              Slider.adaptive(
                max: 100,
                min: -100,
                value: sliderValue,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                  print(value);
                },
              ),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  print('click');
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white12,
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  print('click');
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white12,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // showAboutDialog(context: context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(title: Text('Alert'));
                    },
                  );
                },
                child: Text('open Dialog'),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(
                      backgroundColor: Colors.red,
                      content: Text('ssss'),
                      actions: [
                        CloseButton(
                          onPressed: () {
                            ScaffoldMessenger.of(
                              context,
                            ).hideCurrentMaterialBanner();
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: Text("open material banner"),
              ),
              ElevatedButton(
                onPressed: () {
                  showTopToast(context, 'hello world');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  // foregroundColor: Colors.white,
                ),
                child: Text('SnackBar'),
              ),
              FilledButton(onPressed: () {}, child: Text('Filled Button')),
              TextButton(onPressed: () {}, child: Text('Text Button')),
              OutlinedButton(onPressed: () {}, child: Text('outlined button')),
              CloseButton(),
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }
}
