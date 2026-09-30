import 'package:flutter/material.dart';
import 'package:movie_discovery/features/bottom/controller/bottom_bar_controller.dart';
import 'package:movie_discovery/features/bottom/views/widgets/app_bottom_bar.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomBarController>(
      builder: (context, controller, child) {
        return Scaffold(
          body: controller.pages[controller.currentIndex],
          bottomNavigationBar: AppBottomBar(
            currentIndex: controller.currentIndex,
            onTap: controller.changePage,
          ),
        );
      },
    );
  }
}
