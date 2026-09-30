import 'package:flutter/material.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';

class ProfileTile extends StatelessWidget {
   ProfileTile({
    super.key,
    required this.profileImage,
    required this.profileScreenTitle,
    required this.onTap,
    this.height,
    this.width,
  });

  final String profileImage;
  final String profileScreenTitle;
  final void Function() onTap;
  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: width ?? 100,
            height: height ?? 92,

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(profileImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5),
              color: AppColors.primaryFontColor,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          profileScreenTitle,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryFontColor,
          ),
        ),
      ],
    );
  }
}
