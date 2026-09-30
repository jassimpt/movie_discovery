import 'package:flutter/material.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';

class CustomDownloadButton extends StatelessWidget {
  const CustomDownloadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 40,
        decoration: BoxDecoration(color: AppColors.searchfieldColor),
        child: Center(
          child: Text(
            "Find Something to Download",
            style: TextStyle(
              color: AppColors.primaryFontColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
