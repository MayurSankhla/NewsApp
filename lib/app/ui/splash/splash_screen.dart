import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/news_logo.png',
          fit: BoxFit.cover,
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.width/2,
          width: MediaQuery.of(context).size.width/2,
        ),
      ),
    );
  }
}
