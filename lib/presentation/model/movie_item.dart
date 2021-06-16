


import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';

class MovieItem {
  final int movieId;
 final String posterImg;
 final String title;
 final String overview;
 final String releaseDate;
  final double popularity;
  final String rating;
  final int voteCount;

  MovieItem({
    @required this.movieId,
    this.posterImg,
    this.title,
    this.overview,
    this.releaseDate,
    this.rating,
    this.popularity,
    this.voteCount
  });

}

