import 'package:flutter/material.dart';
import 'package:movie_discovery/core/constants/assets_constants.dart';

class ProfileTopSection extends StatelessWidget {
  const ProfileTopSection({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox()),
        Image.asset(
          AssetsConstants.appSplashLogo,
          width: screenWidth * 0.3,
          fit: BoxFit.contain,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              AssetsConstants.pencilEditIcon,
              width: 25,
              height: 25,
            ),
          ),
        ),
      ],
    );
  }
}