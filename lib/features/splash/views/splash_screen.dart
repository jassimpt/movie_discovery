import 'package:flutter/material.dart';
import 'package:movie_discovery/core/constants/assets_constants.dart';
import 'package:movie_discovery/features/profile/views/profile_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    const designWidth = 375.0;
    final scale = size.width / designWidth;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 332 * scale,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                AssetsConstants.appSplashLogo,
                width: 207 * scale,
                height: 55.79 * scale,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
