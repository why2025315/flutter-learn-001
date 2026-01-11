import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widget_tree.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController(text: 'admin');
  final passwordController = TextEditingController(text: '123');

  final String confirmUserName = 'admin';
  final String confirmPassword = '123';

  @override
  void initState() {
    print('LoginPage initState');
    super.initState();
  }

  @override
  dispose() {
    print('LoginPage dispose');
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('LoginPage build');
    final orientation = MediaQuery.of(context).orientation;
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: orientation == Orientation.portrait ? AppBar() : null,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FractionallySizedBox(
                  widthFactor: widthScreen > 500 ? 0.5 : 1,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Lottie.asset('assets/lotties/Home 3d illustration.json'),
                      TextField(
                        controller: userNameController,
                        decoration: InputDecoration(
                          labelText: '用户名',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: '密码',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 16),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          minimumSize: Size(double.infinity, 40),
                        ),
                        onPressed: () {
                          onLoginPressed();
                        },
                        child: Text(widget.title),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle login logic here
                        },
                        child: Text('忘记密码?'),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void onLoginPressed() {
    if (confirmUserName == userNameController.text &&
        confirmPassword == passwordController.text) {
      // 把所有页面都弹出，然后进入主页面
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WidgetTree()),
        (route) => false,
      );
    }
  }

  // todo 弄清楚SingleChildScrollView Center布局

  Widget _buildLandscapeLayout(context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Lottie.asset('assets/lotties/Home 3d illustration.json'),
            ),
            Expanded(
              // 必须用Center包裹SingleChildScrollView, 否则不能占满屏幕
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: userNameController,
                          decoration: InputDecoration(
                            labelText: '用户名',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: '密码',
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 16),
                        FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: Size(double.infinity, 40),
                          ),
                          onPressed: () {
                            onLoginPressed();
                          },
                          child: Text(widget.title),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle login logic here
                          },
                          child: Text('忘记密码?'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(left: 0, top: 10, child: BackButton()),
      ],
    );
  }

  Widget _buildPortraintLayout(context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Lottie.asset('assets/lotties/Home 3d illustration.json'),
              TextField(
                controller: userNameController,
                decoration: InputDecoration(
                  labelText: '用户名',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: '密码',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 40),
                ),
                onPressed: () {
                  onLoginPressed();
                },
                child: Text(widget.title),
              ),
              TextButton(
                onPressed: () {
                  // Handle login logic here
                },
                child: Text('忘记密码?'),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
