import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_discovery/core/constants/assets_constants.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';
import 'package:movie_discovery/features/more/views/widgets/custom_manage_profiles_button.dart';
import 'package:movie_discovery/features/more/views/widgets/menu_item.dart';
import 'package:movie_discovery/features/more/views/widgets/more_profiles_section.dart';
import 'package:movie_discovery/features/more/views/widgets/tell_friends_section.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              MoreProfilesSection(),
              const SizedBox(height: 10),
              CustomManageProfilesButton(),
              const SizedBox(height: 10),
              TellFriendsSection(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Image.asset(
                      AssetsConstants.tickIcon,
                      width: 28,
                      height: 28,
                      color: AppColors.primaryFontColor,
                    ),
                    const SizedBox(width: 14),
                    const Text(
                      'My List',
                      style: TextStyle(
                        color: AppColors.primaryFontColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              const Divider(
                color: AppColors.searchfieldColor,
                thickness: 1,
                height: 1,
              ),

              MenuItem(label: 'App Settings'),
              MenuItem(label: 'Account'),
              MenuItem(label: 'Help'),
              MenuItem(label: 'Sign Out'),
            ],
          ),
        ),
      ),
    );
  }
}

