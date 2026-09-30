
import 'package:flutter/material.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';

class NotificationTopSection extends StatelessWidget {
  const NotificationTopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.redIconColor,
            ),
            child: Center(
              child: Icon(
                Icons.notifications,
                color: AppColors.primaryFontColor,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            "Notifications",
            style: TextStyle(
              color: AppColors.primaryFontColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}