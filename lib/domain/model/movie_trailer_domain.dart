import 'package:newfluttermovieapp/presentation/model/movie_item.dart';

class MovieTrailerDomain {
  String? trailerKey;
  String? trailerName;
  String? trailerSite;
  int? trailerSize;

  MovieTrailerDomain({
    this.trailerKey,
    this.trailerName,
    this.trailerSite,
    this.trailerSize,
  });

  static List<MovieTrailerDomain> movieTrailer(Map<String, dynamic> json) {
    final jsonArray = json['results'];
    final list = <MovieTrailerDomain>[];
    for (final item in jsonArray) {
      MovieTrailerDomain movieTrailer = MovieTrailerDomain();
      movieTrailer.trailerKey = item['key'];
      movieTrailer.trailerName = item['name'];
      movieTrailer.trailerSite = item['site'];
      movieTrailer.trailerSize = item['size'];
      list.add(movieTrailer);
    }
    return list;
  }
}

