import 'package:flutter/material.dart';
import 'package:flutter_demo001/data/notifiers.dart';
import 'package:flutter_demo001/views/pages/setting_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/constants.dart';
import '../widgets/navbar_widget.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter demo'),
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              brightnessNotifier.value = !brightnessNotifier.value;
              final prefs = await SharedPreferences.getInstance();
              print('set themeMode ${brightnessNotifier.value}');
              await prefs.setBool(
                KConstants.themeModeKey,
                brightnessNotifier.value,
              );
            },
            icon: ValueListenableBuilder(
              valueListenable: brightnessNotifier,
              builder: (context, brightness, child) {
                return Icon(brightness ? Icons.dark_mode : Icons.light_mode);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingPage(title: 'Settings');
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      drawer: Drawer(),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
