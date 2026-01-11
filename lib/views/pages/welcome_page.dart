import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'login_page.dart';
import 'onboarding_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    print('WelcomePage build ${orientation.toString()}');
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 252, 245, 223),
        child: orientation == Orientation.portrait
            ? _buildPortraintLayout(context)
            : _buildLandscapeLayout(context),
      ),
    );
  }

  // 屏幕旋转
  Widget _buildPortraintLayout(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 100),
        Expanded(
          child: Center(
            child: FittedBox(
              child: Text(
                "一切美好终将发生在不经意间",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingPage(),
                    ),
                  );
                },
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 40),
                ),
                child: Text('开始体验'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(title: '登录'),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 40),
                ),
                child: Text('登录'),
              ),
            ],
          ),
        ),
        Lottie.asset(
          'assets/lotties/Sunshine and Moonlight Character.json',
          width: double.infinity,
          fit: BoxFit.cover,
          repeat: true,
        ),
      ],
    );
  }

  // 横屏
  Widget _buildLandscapeLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Lottie.asset(
          'assets/lotties/Sunshine and Moonlight Character.json',
          fit: BoxFit.contain,
          repeat: false,
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FittedBox(
                    child: Text(
                      "一切美好终将发生在不经意间",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingPage(),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    // minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const Text('开始体验'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(title: '登录'),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    // minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const Text('登录'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
