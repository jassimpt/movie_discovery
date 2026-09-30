import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_discovery/core/constants/url_constants.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';
import 'package:movie_discovery/features/home/controller/home_controller.dart';
import 'package:movie_discovery/features/home/views/widgets/empty_state.dart';
import 'package:movie_discovery/features/home/views/widgets/shimmer_row.dart';

class PreviewsSection extends StatelessWidget {
  final HomeController controller;
  const PreviewsSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    final previews = [
      ...controller.popularMovies.map((e) => e.posterPath),
      ...controller.trendingNow.map((e) => e.posterPath),
      ...controller.newReleases.map((e) => e.posterPath),
    ].whereType<String>().take(15).toList();

    final isLoading =
        controller.popularMoviesLoader &&
        controller.trendingNowLoader &&
        controller.newReleasesLoader;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Previews',
            style: TextStyle(
              color: AppColors.primaryFontColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: isLoading
              ? ShimmerRow(isCircle: true)
              : previews.isEmpty
              ? const EmptyState()
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: previews.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    return ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: '${UrlConstants.imageBase}${previews[index]}',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        errorWidget: (_, __, ___) => Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF1A1A1A),
                          ),
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