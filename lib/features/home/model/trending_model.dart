class TrendingResult {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? mediaType;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final bool? softcore;
  final double? voteAverage;
  final int? voteCount;
  final String? overview;
  final String? posterPath;

  // Movie-only fields
  final String? title;
  final String? originalTitle;
  final String? releaseDate;
  final bool? video;

  // TV-only fields
  final String? name;
  final String? originalName;
  final String? firstAirDate;
  final List<String>? originCountry;

  TrendingResult({
    this.adult,
    this.backdropPath,
    this.id,
    this.mediaType,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.softcore,
    this.voteAverage,
    this.voteCount,
    this.overview,
    this.posterPath,
    this.title,
    this.originalTitle,
    this.releaseDate,
    this.video,
    this.name,
    this.originalName,
    this.firstAirDate,
    this.originCountry,
  });

  factory TrendingResult.fromJson(Map<String, dynamic> json) {
    return TrendingResult(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      mediaType: json['media_type'] as String?,
      originalLanguage: json['original_language'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      popularity: (json['popularity'] as num?)?.toDouble(),
      softcore: json['softcore'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      title: json['title'] as String?,
      originalTitle: json['original_title'] as String?,
      releaseDate: json['release_date'] as String?,
      video: json['video'] as bool?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      firstAirDate: json['first_air_date'] as String?,
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'id': id,
      'media_type': mediaType,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'popularity': popularity,
      'softcore': softcore,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'overview': overview,
      'poster_path': posterPath,
      'title': title,
      'original_title': originalTitle,
      'release_date': releaseDate,
      'video': video,
      'name': name,
      'original_name': originalName,
      'first_air_date': firstAirDate,
      'origin_country': originCountry,
    };
  }
}
