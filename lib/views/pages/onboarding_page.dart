import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../data/constants.dart';
import 'login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Onboarding')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset(
                'assets/lotties/Welcome.json',
                width: double.infinity,
                fit: BoxFit.cover,
                repeat: true,
              ),
              SizedBox(height: 100),
              Text('一切美好终将发生在不经意间', style: KtextStyle.descriptionText),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(title: '注册'),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                  ),
                  child: Text('下一步'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
