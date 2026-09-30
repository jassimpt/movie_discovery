import 'package:flutter/material.dart';
import 'package:movie_discovery/core/constants/assets_constants.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';
import 'package:movie_discovery/features/more/views/widgets/social_divider.dart';
import 'package:movie_discovery/features/more/views/widgets/social_icon.dart';

class TellFriendsSection extends StatelessWidget {
  const TellFriendsSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(color: AppColors.moreSectionColor),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.message_outlined,
                  color: AppColors.primaryFontColor,
                  size: 22,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Tell friends about Netflix.',
                style: TextStyle(
                  color: AppColors.primaryFontColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa,',
            style: TextStyle(
              color: AppColors.primaryFontColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Terms & Conditions',
            style: TextStyle(
              color: AppColors.primaryFontColor,
              fontSize: 12,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryFontColor,
            ),
          ),

          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: Container(height: 46, color: Colors.black)),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 46,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: AppColors.primaryFontColor,
                  child: const Center(
                    child: Text(
                      'Copy Link',
                      style: TextStyle(
                        color: AppColors.primaryAppColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocialIcon(icon: AssetsConstants.whatsappIcon),
              SocialDivider(),
              SocialIcon(icon: AssetsConstants.facebookIcon),
              SocialDivider(),
              SocialIcon(icon: AssetsConstants.gmailIcon),
              SocialDivider(),
              const SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Image.asset(AssetsConstants.socialMoreIcon, height: 30),
                    Text(
                      'More',
                      style: TextStyle(
                        color: AppColors.primaryFontColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}