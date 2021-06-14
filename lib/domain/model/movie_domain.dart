import 'package:flutter_base_architecture/dto/base_dto.dart';
import 'package:newfluttermovieapp/presentation/model/movie_item.dart';

class MovieDomain {
  int movieId = -1;
  String posterImg;
  String overview;
  String releaseDate;
  String title;
  int vote;

  MovieDomain({
    this.movieId: -1,
    this.posterImg,
    this.overview,
    this.releaseDate,
    this.title,
    this.vote,
  });

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
extension MovieListExtension on List<MovieDomain> {
  List<MovieItem> mapToMovieListItem() =>
      map((e) => e.mapToMoviePresentation()).toList();
}
