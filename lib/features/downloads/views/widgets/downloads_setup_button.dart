import 'package:flutter/material.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';

class DownloadsSetupButton extends StatelessWidget {
  const DownloadsSetupButton({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: AppColors.downloadsButtonColors,
      ),
      child: Center(
        child: Text(
          "SETUP",
          style: TextStyle(
            color: AppColors.primaryFontColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}