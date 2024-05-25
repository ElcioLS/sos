import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {

      Navigator.of(context).pushReplacementNamed('/home');
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('ElcioDev.com'),
            Image.asset(
              'assets/images/logo2.png',
              width: 100,
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
    );
  }
}
