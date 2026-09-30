import 'package:flutter/material.dart';
import 'package:movie_discovery/core/constants/assets_constants.dart';
import 'package:movie_discovery/core/constants/text_constants.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';
import 'package:movie_discovery/features/profile/views/widgets/profile_tile.dart';

class MoreProfilesSection extends StatelessWidget {
  const MoreProfilesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfileTile(
          height: 70,
          width: 80,
          onTap: () {},
          profileImage: AssetsConstants.emenaloProfileImage,
          profileScreenTitle: TextConstants.profileScreenEmenalo,
        ),
    
        ProfileTile(
          height: 65,
          width: 65,
          onTap: () {},
          profileImage: AssetsConstants.onyekaProfileImage,
          profileScreenTitle: TextConstants.profileScreenOnyeka,
        ),
    
        ProfileTile(
          height: 65,
          width: 65,
          onTap: () {},
          profileImage: AssetsConstants.thelmaProfileImage,
          profileScreenTitle: TextConstants.profileScreenThelma,
        ),
    
        ProfileTile(
          height: 65,
          width: 65,
          onTap: () {},
          profileImage: AssetsConstants.kidsProfileImage,
          profileScreenTitle: TextConstants.profileScreenKids,
        ),
    
        Column(
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryFontColor),
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: AppColors.primaryFontColor,
                  size: 40,
                ),
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ],
    );
  }
}