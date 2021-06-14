


import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';

class MovieItem {
  final int movieId;
  String posterImg;
  String title;
  int vote;
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

}

