import 'package:flutter/material.dart';
import 'package:movie_discovery/core/constants/assets_constants.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';

class CustomManageProfilesButton extends StatelessWidget {
  const CustomManageProfilesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AssetsConstants.pencilEditIcon,
            width: 16,
            height: 16,
            color: AppColors.primaryFontColor,
          ),
          const SizedBox(width: 6),
          const Text(
            'Manage Profiles',
            style: TextStyle(
              color: AppColors.primaryFontColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}