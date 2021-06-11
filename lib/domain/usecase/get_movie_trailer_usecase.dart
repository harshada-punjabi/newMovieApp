

import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';
import 'package:newfluttermovieapp/domain/model/movie_trailer_domain.dart';
import 'package:newfluttermovieapp/domain/repositories/movie_repository.dart';
import 'package:newfluttermovieapp/presentation/model/movie_item.dart';
import 'base_usecase.dart';

// class GetMovieTrailerUseCase extends BaseUseCase<List<MovieItem>, GetMovieTrailerUseCaseParams>{
//   final MovieRepository _repository;
//   GetMovieTrailerUseCase(this._repository);
//   @override
//   Future<List<MovieItem>> buildUseCaseFuture(
//       {@required GetMovieTrailerUseCaseParams params}) async {
//
//     List<MovieTrailerDomain> movieTrailerDomainList  = await _repository.fetchMovieTrailer(params);
//
//     return movieTrailerDomainList.mapToMovieTrailerItem();
//   }
//
// }
//
// class GetMovieTrailerUseCaseParams {
//   final int movieId;
//
//
//   GetMovieTrailerUseCaseParams(
//       {this.movieId = 1,
//       });
// }