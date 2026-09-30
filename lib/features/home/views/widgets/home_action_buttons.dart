import 'package:flutter/material.dart';
import 'package:movie_discovery/features/home/views/widgets/info_button.dart';
import 'package:movie_discovery/features/home/views/widgets/my_list_button.dart';
import 'package:movie_discovery/features/home/views/widgets/play_button.dart';

class HomeActionButtons extends StatelessWidget {
  const HomeActionButtons({
    super.key,
    required this.onMyListTap,
    required this.onPlayTap,
    required this.onInfoTap,
  });

  final VoidCallback onMyListTap;
  final VoidCallback onPlayTap;
  final VoidCallback onInfoTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: MyListButton(
              onTap: onMyListTap,
            ),
          ),
        ),

        Expanded(
          child: Center(
            child: PlayButton(
              onTap: onPlayTap,
            ),
          ),
        ),

        Expanded(
          child: Center(
            child: InfoButton(
              onTap: onInfoTap,
            ),
          ),
        ),
      ],
    );
  }
}