
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';
import 'base_entity.dart';
import 'maps_extensions.dart';


class MovieEntity extends BaseEntity {

  final int movieId;
  final String posterImg;
  final String title;
   var vote;
  final String overview;
  final String releaseDate;

  MovieEntity({
     this.movieId,
     this.posterImg,
     this.title,
     this.overview,
     this.releaseDate,
    this.vote

  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> extension = json.getOrElse(
        'extension', Map<String, dynamic>()) as Map<String, dynamic>;
    return MovieEntity(
      movieId: json.getOrElse('id', ''),
      posterImg: json.getOrElse('poster_path', ''),
      overview: json.getOrElse('overview', ''),
      releaseDate: json.getOrElse('release_date', ''),
      title: json.getOrElse('title', ''),
      vote: json.getOrElse('vote_average', ''),




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
