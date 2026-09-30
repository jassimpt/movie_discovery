import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_discovery/core/constants/url_constants.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';
import 'package:movie_discovery/features/home/views/widgets/empty_state.dart';
import 'package:movie_discovery/features/home/views/widgets/shimmer_row.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final bool isLoading;
  final List<String> posters;

  const MovieSection({
    required this.title,
    required this.isLoading,
    required this.posters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.primaryFontColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 160,
          child: isLoading
              ? ShimmerRow(isCircle: false)
              : posters.isEmpty
              ? const EmptyState()
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: posters.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: '${UrlConstants.imageBase}${posters[index]}',
                        width: 107,
                        height: 160,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => Container(
                          width: 107,
                          height: 160,
                          color: const Color(0xFF1A1A1A),
                        ),
                        errorWidget: (_, __, ___) => Container(
                          width: 107,
                          height: 160,
                          color: const Color(0xFF1A1A1A),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
