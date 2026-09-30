import 'package:flutter/material.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';

class SocialDivider extends StatelessWidget {
  const SocialDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 44,
      color: AppColors.socialDivider,
      margin: const EdgeInsets.only(right: 16),
    );
  }
}