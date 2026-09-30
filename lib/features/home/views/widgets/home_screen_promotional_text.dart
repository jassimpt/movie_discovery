import 'package:flutter/material.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';

class HomeScreenPromotionalText extends StatelessWidget {
  const HomeScreenPromotionalText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 20,
            // height: 35,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              children: [
                Text(
                  "Top",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryFontColor,
                    fontSize: 7,
                  ),
                ),
                Text(
                  "10",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryFontColor,
                    fontSize: 7,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 5),
          Text(
            "#2 in Nigeria Today",
            style: TextStyle(
              color: AppColors.primaryFontColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
