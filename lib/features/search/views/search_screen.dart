import 'package:flutter/material.dart' hide SearchController;
import 'package:movie_discovery/core/helpers/app_colors.dart';
import 'package:movie_discovery/features/home/controller/home_controller.dart';
import 'package:movie_discovery/features/home/model/trending_model.dart';
import 'package:movie_discovery/features/search/controller/search_controller.dart';
import 'package:movie_discovery/features/search/views/widgets/custom_search_field.dart';
import 'package:movie_discovery/features/search/views/widgets/search_item_card.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchField(),
            const SizedBox(height: 10),
            Expanded(
              child: Consumer<SearchController>(
                builder: (context, searchController, _) {
                  if (searchController.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    );
                  }

                  if (searchController.currentQuery.isNotEmpty &&
                      searchController.searchResults.isEmpty) {
                    return Center(
                      child: Text(
                        "No results found for '${searchController.currentQuery}'",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }

                  if (searchController.searchResults.isNotEmpty) {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: searchController.searchResults.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 5),
                      itemBuilder: (context, index) {
                        final item = searchController.searchResults[index];
                        return SearchItemCard(item: item);
                      },
                    );
                  }

                  return Consumer<HomeController>(
                    builder: (context, homeController, _) {
                      if (homeController.popularMovies.isEmpty) {
                        return const Center(
                          child: Text(
                            "No suggestions",
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Text(
                              "Top Searches",
                              style: TextStyle(
                                color: AppColors.primaryFontColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              itemCount: homeController.popularMovies.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 5),
                              itemBuilder: (context, index) {
                                final popular =
                                    homeController.popularMovies[index];
                                final mappedItem = TrendingResult(
                                  backdropPath: popular.backdropPath,
                                  title: popular.title,
                                  mediaType: 'movie',
                                  id: popular.id,
                                  posterPath: popular.posterPath,
                                  originalLanguage: popular.originalLanguage,
                                  originalTitle: popular.originalTitle,
                                  overview: popular.overview,
                                  popularity: popular.popularity,
                                  releaseDate: popular.releaseDate,
                                  adult: popular.adult,
                                  genreIds: popular.genreIds,
                                  voteAverage: popular.voteAverage,
                                  voteCount: popular.voteCount,
                                );
                                return SearchItemCard(item: mappedItem);
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
