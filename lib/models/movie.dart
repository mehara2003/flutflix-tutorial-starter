
class Movie_list {
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String original_language;
  double voteAverage;
  double popularity;

  
  Movie_list({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.original_language,
    required this.voteAverage,
    required this.popularity,


  });

  factory Movie_list.fromJson(Map<String, dynamic> json) {
  return Movie_list(
    title: json["title"].toString(),
    backDropPath: json["backdrop_path"].toString(),
    originalTitle: json["original_title"].toString(),
    overview: json["overview"].toString(),
    posterPath: json["poster_path"].toString(),
    releaseDate: json["release_date"].toString(),
    original_language: json["original_language"].toString(),
    voteAverage: json["vote_average"].toDouble(),
    popularity: json["popularity"].toDouble(),
  );
}

}

class MovieList {
  int page;
  List<Movie_list?> results;

  MovieList({
    required this.page,
    required this.results,
  });

  factory MovieList.fromJson(Map<String, dynamic> json) {
    return MovieList(
      page: json["page"],
      results: List<Movie_list?>.from(json["results"].map((movieJson) => Movie_list.fromJson(movieJson))),
    );
  }
}