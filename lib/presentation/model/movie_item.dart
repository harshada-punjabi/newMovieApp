


import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';

class MovieItem {
  final int movieId;
  String posterImg;
  String title;
  var vote;
  String overview;
  String releaseDate;

  MovieItem({
    @required this.movieId,
    this.posterImg,
    this.title,
    this.vote,
    this.overview,
    this.releaseDate,
  });

  bool isTemporaryUser() => this.movieId == -1;
}

extension DomainToPresenationExt on MovieDomain {
  MovieItem mapToPresentation() => MovieItem(
        movieId: this.movieId,
        title: this.title,
        posterImg: this.posterImg,
        overview: this.overview,
        releaseDate: this.releaseDate,
        vote: this.vote,
      );
}
