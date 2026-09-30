import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_discovery/core/constants/url_constants.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';
import 'package:movie_discovery/core/utils/app_utils.dart';
import 'package:movie_discovery/features/coming_soon/views/widgets/action_button.dart';
import 'package:movie_discovery/features/home/model/popular_model.dart';

class ComingSoonCard extends StatelessWidget {
  const ComingSoonCard({super.key, required this.movie});

  final PopularMovie movie;

  @override
  Widget build(BuildContext context) {
    final genres = (movie.genreIds ?? [])
        .map((id) => AppUtils.genreMapFromTmdb[id])
        .whereType<String>()
        .toList();

    final releaseLabel = AppUtils.formatReleaseDate(movie.releaseDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: movie.backdropPath != null
              ? CachedNetworkImage(
                  imageUrl:
                      '${UrlConstants.imageBaseOriginal}${movie.backdropPath}',
                  fit: BoxFit.cover,
                  placeholder: (_, __) =>
                      Container(color: const Color(0xFF1A1A1A)),
                  errorWidget: (_, __, ___) =>
                      Container(color: const Color(0xFF1A1A1A)),
                )
              : Container(color: const Color(0xFF1A1A1A)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ActionButton(icon: Icons.notifications, label: 'Remind Me'),
              const SizedBox(width: 40),
              ActionButton(icon: Icons.share, label: 'Share'),
            ],
          ),
        ),
        if (releaseLabel.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              releaseLabel,
              style: const TextStyle(
                color: AppColors.secondaryfontColor,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            movie.title ?? movie.originalTitle ?? '',
            style: const TextStyle(
              color: AppColors.primaryFontColor,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        const SizedBox(height: 8),
        if ((movie.overview ?? '').isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              movie.overview!,
              style: const TextStyle(
                color: AppColors.secondaryfontColor,
                fontSize: 14,
                height: 1.5,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),

        const SizedBox(height: 10),
        if (genres.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Wrap(
              spacing: 0,
              children: [
                for (int i = 0; i < genres.length; i++) ...[
                  Text(
                    genres[i],
                    style: const TextStyle(
                      color: AppColors.primaryFontColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (i < genres.length - 1)
                    const Text(
                      ' • ',
                      style: TextStyle(
                        color: AppColors.primaryFontColor,
                        fontSize: 13,
                      ),
                    ),
                ],
              ],
            ),
          ),
        const SizedBox(height: 10),
      ],
    );
  }
}
