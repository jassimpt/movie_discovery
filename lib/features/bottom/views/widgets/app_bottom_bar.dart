import 'package:flutter/material.dart';
import 'package:movie_discovery/core/constants/assets_constants.dart';
import 'package:movie_discovery/features/bottom/views/widgets/bottom_bar_item.dart';

class AppBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: const Color(0xFF121212),
      child: Row(
        children: [
          BottomBarItem(
            index: 0,
            currentIndex: currentIndex,
            icon: AssetsConstants.homeIcon,
            label: 'Home',
            onTap: onTap,
          ),

          BottomBarItem(
            index: 1,
            currentIndex: currentIndex,
            icon: AssetsConstants.searchIcon,
            label: 'Search',
            onTap: onTap,
          ),

          BottomBarItem(
            index: 2,
            currentIndex: currentIndex,
            icon: AssetsConstants.comingSoonIcon,
            label: 'Coming Soon',
            badgeCount: 4,
            onTap: onTap,
          ),

          BottomBarItem(
            index: 3,
            currentIndex: currentIndex,
            icon: AssetsConstants.downloadsIcon,
            label: 'Downloads',
            onTap: onTap,
          ),

          BottomBarItem(
            index: 4,
            currentIndex: currentIndex,
            icon: AssetsConstants.moreIcon,
            label: 'More',
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
