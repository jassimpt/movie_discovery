import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_discovery/core/constants/assets_constants.dart';
import 'package:movie_discovery/core/constants/url_constants.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';
import 'package:movie_discovery/features/home/controller/home_controller.dart';
import 'package:movie_discovery/features/home/views/widgets/home_action_buttons.dart';
import 'package:movie_discovery/features/home/views/widgets/home_screen_promotional_text.dart';
import 'package:movie_discovery/features/home/views/widgets/movie_section.dart';
import 'package:movie_discovery/features/home/views/widgets/previews_section.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>().fetchAllHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<HomeController>(
              builder: (context, ctrl, _) {
                String? backdropPath;
                if (ctrl.popularMovies.isNotEmpty) {
                  backdropPath = ctrl.popularMovies.first.backdropPath;
                }

                return Stack(
                  children: [
                    SizedBox(
                      width: screenWidth,
                      height: screenHeight * 0.55,
                      child: backdropPath != null
                          ? CachedNetworkImage(
                              imageUrl:
                                  '${UrlConstants.imageBaseOriginal}$backdropPath',
                              fit: BoxFit.cover,
                              placeholder: (_, __) =>
                                  Container(color: Colors.grey[900]),
                              errorWidget: (_, __, ___) =>
                                  Container(color: Colors.grey[900]),
                            )
                          : Container(color: Colors.grey[900]),
                    ),

                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: screenHeight * 0.25,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              AppColors.primaryAppColor,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 50,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(AssetsConstants.netflixLogoSmall),
                            Text(
                              'TV Shows',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryFontColor,
                              ),
                            ),

                            Text(
                              'Movies',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryFontColor,
                              ),
                            ),

                            Text(
                              'My List',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryFontColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 8),
            HomeScreenPromotionalText(),
            HomeActionButtons(
              onMyListTap: () {},
              onPlayTap: () {},
              onInfoTap: () {},
            ),
            const SizedBox(height: 20),

            Consumer<HomeController>(
              builder: (context, ctrl, _) {
                return PreviewsSection(controller: ctrl);
              },
            ),

            const SizedBox(height: 24),

            Consumer<HomeController>(
              builder: (context, ctrl, _) {
                return MovieSection(
                  title: 'Popular on Netflix',
                  isLoading: ctrl.popularMoviesLoader,
                  posters: ctrl.popularMovies
                      .map((m) => m.posterPath)
                      .whereType<String>()
                      .toList(),
                );
              },
            ),

            const SizedBox(height: 24),

            Consumer<HomeController>(
              builder: (context, ctrl, _) {
                return MovieSection(
                  title: 'Trending Now',
                  isLoading: ctrl.trendingNowLoader,
                  posters: ctrl.trendingNow
                      .map((m) => m.posterPath)
                      .whereType<String>()
                      .toList(),
                );
              },
            ),

            const SizedBox(height: 24),
            Consumer<HomeController>(
              builder: (context, ctrl, _) {
                return MovieSection(
                  title: 'Top 10 in Nigeria Today',
                  isLoading: ctrl.top10Loader,
                  posters: ctrl.top10Movies
                      .map((m) => m.posterPath)
                      .whereType<String>()
                      .toList(),
                );
              },
            ),

            const SizedBox(height: 24),

            Consumer<HomeController>(
              builder: (context, ctrl, _) {
                return MovieSection(
                  title: 'New Releases',
                  isLoading: ctrl.newReleasesLoader,
                  posters: ctrl.newReleases
                      .map((m) => m.posterPath)
                      .whereType<String>()
                      .toList(),
                );
              },
            ),

            const SizedBox(height: 24),

            Consumer<HomeController>(
              builder: (context, ctrl, _) {
                return MovieSection(
                  title: 'African Movies',
                  isLoading: ctrl.africanMoviesLoader,
                  posters: ctrl.africanMovies
                      .map((m) => m.posterPath)
                      .whereType<String>()
                      .toList(),
                );
              },
            ),

            const SizedBox(height: 24),

            Consumer<HomeController>(
              builder: (context, ctrl, _) {
                return MovieSection(
                  title: 'TV Thrillers & Mystery',
                  isLoading: ctrl.tvThrillersMysteryLoader,
                  posters: ctrl.tvThrillersMystery
                      .map((m) => m.posterPath)
                      .whereType<String>()
                      .toList(),
                );
              },
            ),

            const SizedBox(height: 24),

            Consumer<HomeController>(
              builder: (context, ctrl, _) {
                return MovieSection(
                  title: 'US TV Shows',
                  isLoading: ctrl.usTvShowsLoader,
                  posters: ctrl.usTvShows
                      .map((m) => m.posterPath)
                      .whereType<String>()
                      .toList(),
                );
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
