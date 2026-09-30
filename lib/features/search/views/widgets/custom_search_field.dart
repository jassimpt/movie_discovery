import 'package:flutter/material.dart' hide SearchController;
import 'package:movie_discovery/core/helpers/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:movie_discovery/features/search/controller/search_controller.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.secondaryButtonColor,
      style: TextStyle(
        color: AppColors.secondaryButtonColor,
        fontSize: 18,
      ),
      onChanged: (value) {
        context.read<SearchController>().search(value);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.searchfieldColor,
        border: InputBorder.none,
    
        hintText: 'Search for a show, movie, genre, e.t.c.',
        hintStyle: TextStyle(
          color: AppColors.secondaryButtonColor,
          fontSize: 18,
        ),
    
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.secondaryButtonColor,
          size: 25,
        ),
    
        suffixIcon: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Icon(
            Icons.mic,
            color: AppColors.secondaryButtonColor,
            size: 25,
          ),
        ),
      ),
    );
  }
}