import 'package:flutter/material.dart';
import 'package:inventory/src/constants/image_strings.dart';
import 'package:inventory/src/constants/text_strings.dart';
import 'package:inventory/src/features/authentication/screens/welcome/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              bottom: animate ? 30 : -30,
              height: 350,
              child: Image(
                image: AssetImage(tSplashISAlogo),
              )),
          Positioned(
              bottom: 100,
              left: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tAppName,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(tAppTagline)
                ],
              ))
        ],
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(Duration(microseconds: 500));
    setState(() => animate = true);
    await Future.delayed(Duration(microseconds: 5000));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }
}
