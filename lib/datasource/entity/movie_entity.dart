import 'package:newfluttermovieapp/domain/model/movie_domain.dart';
import 'maps_extensions.dart';

class MovieEntity {
  final int movieId;
  final String posterImg;
  final String title;
  final int vote;
  final String overview;
  final String releaseDate;
//shift alt cmmand L
  MovieEntity(
      {this.movieId,
      this.posterImg,
      this.title,
      this.overview,
      this.releaseDate,
      this.vote});

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      movieId: json.getOrElse('id', 0),
      posterImg: json.getOrElse('poster_path', ''),
      overview: json.getOrElse('overview', ''),
      releaseDate: json.getOrElse('release_date', ''),
      title: json.getOrElse('title', ''),
      vote: json.getOrElse('vote_count', 0),
    );
  }
}

extension MovieEntityExtention on MovieEntity {
  MovieDomain mapToDomain() => MovieDomain(
        movieId: movieId,
        title: title,
        overview: overview,
        posterImg: posterImg,
        releaseDate: releaseDate,
        vote: vote,
      );
}
extension MovieListExtension on List<MovieEntity> {
  List<MovieDomain> mapToDomain() =>
      map((e) => e.mapToDomain()).toList();
}