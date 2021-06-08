import 'package:flutter_base_architecture/dto/base_dto.dart';
import 'package:newfluttermovieapp/presentation/model/movie_item.dart';

class MovieDomain extends BaseDto {
 late int movieId = -1;
 late String posterImg;
 late String overview;
 late String releaseDate;
  late String title;
 late var vote;



  MovieDomain({
    this.movieId: -1,
    required this.posterImg,
    required this.overview,
    required this.releaseDate,
    required this.title,
    this.vote,
  });

  @override
  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["id"] = movieId;
    map["poster_path"] = posterImg;
    map["overview"] = overview;
    map["release_date"] = releaseDate;
    map["title"] = title;
    map["vote_average"] = vote;

    return map;
  }

  MovieDomain.fromJson(Map<String, dynamic> objects) {
    movieId = objects["id"];
    posterImg = objects["poster_path"];
    releaseDate = objects["release_date"];
    overview = objects["overview"];
    vote = objects["vote_average"];
    title = objects["title"];

  }
}

extension MovieExtention on MovieDomain {
  MovieItem mapToMoviePresentation() =>
      MovieItem(
        movieId: this.movieId,
        releaseDate: this.releaseDate,
        overview: this.overview,
        title: this.title,
        posterImg: this.posterImg,
      );
}
