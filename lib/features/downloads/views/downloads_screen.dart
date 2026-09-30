import 'package:flutter/material.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';
import 'package:movie_discovery/features/downloads/views/widgets/custom_download_button.dart';
import 'package:movie_discovery/features/downloads/views/widgets/downloads_setup_button.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Smart Downloads",
                  style: TextStyle(
                    color: AppColors.primaryFontColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Introducing Downloads For You",
                style: TextStyle(
                  color: AppColors.primaryFontColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam enim non posuere pulvinar diam.',
                style: TextStyle(
                  color: AppColors.primaryFontColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 30),

              Center(
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.searchfieldColor,
                  ),
                ),
              ),
              SizedBox(height: 30),

              DownloadsSetupButton(screenWidth: screenWidth),
              SizedBox(height: 30),

              CustomDownloadButton(),
            ],
          ),
        ),
      ),
    );
  }
}
