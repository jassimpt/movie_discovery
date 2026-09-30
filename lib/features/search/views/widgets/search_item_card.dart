import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_discovery/core/constants/url_constants.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';
import 'package:movie_discovery/features/home/model/trending_model.dart';

class SearchItemCard extends StatelessWidget {
  const SearchItemCard({super.key, required this.item});

  final TrendingResult item;

  @override
  Widget build(BuildContext context) {
    final imagePath = item.backdropPath ?? item.posterPath;
    final displayTitle = item.title ?? item.name ?? "Unknown Title";

    return Container(
      color: AppColors.searchfieldColor,
      height: 80,
      child: Row(
        children: [
          SizedBox(
            width: 140,
            height: 80,
            child: imagePath != null
                ? CachedNetworkImage(
                    imageUrl: '${UrlConstants.imageBase}$imagePath',
                    fit: BoxFit.cover,
                    placeholder: (_, __) => Container(color: Colors.grey[800]),
                    errorWidget: (_, __, ___) => Container(
                      color: Colors.grey[800],
                      child: const Icon(Icons.error, color: Colors.white),
                    ),
                  )
                : Container(color: Colors.grey[800]),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Text(
              displayTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
