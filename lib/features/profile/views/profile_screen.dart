import 'package:flutter/material.dart';
import 'package:movie_discovery/core/constants/assets_constants.dart';
import 'package:movie_discovery/core/constants/text_constants.dart';
import 'package:movie_discovery/features/bottom/views/bottom_bar.dart';
import 'package:movie_discovery/features/home/views/home_screen.dart';
import 'package:movie_discovery/features/profile/views/widgets/add_profile_button.dart';
import 'package:movie_discovery/features/profile/views/widgets/profile_tile.dart';
import 'package:movie_discovery/features/profile/views/widgets/profile_top_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            ProfileTopSection(screenWidth: screenWidth),

            const SizedBox(height: 150),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileTile(
                  onTap: () => pushToHome(context),
                  profileImage: AssetsConstants.emenaloProfileImage,
                  profileScreenTitle: TextConstants.profileScreenEmenalo,
                ),

                const SizedBox(width: 32),

                ProfileTile(
                  onTap: () => pushToHome(context),
                  profileImage: AssetsConstants.onyekaProfileImage,
                  profileScreenTitle: TextConstants.profileScreenOnyeka,
                ),
              ],
            ),

            const SizedBox(height: 38),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileTile(
                  onTap: () => pushToHome(context),
                  profileImage: AssetsConstants.thelmaProfileImage,
                  profileScreenTitle: TextConstants.profileScreenThelma,
                ),

                const SizedBox(width: 32),

                ProfileTile(
                  onTap: () => pushToHome(context),
                  profileImage: AssetsConstants.kidsProfileImage,
                  profileScreenTitle: TextConstants.profileScreenKids,
                ),
              ],
            ),

            const SizedBox(height: 50),

            SizedBox(
              width: 210,
              child: Align(
                alignment: Alignment.centerLeft,
                child: AddProfile(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pushToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomBar()),
    );
  }
}
