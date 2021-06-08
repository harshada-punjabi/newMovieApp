

import 'dart:async';
import 'dart:js' as js;
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';
import 'package:newfluttermovieapp/domain/model/movie_trailer_domain.dart';
import 'package:newfluttermovieapp/domain/usecase/get_movie_trailer_usecase.dart';
import 'package:newfluttermovieapp/domain/usecase/get_popular_movie_usecase.dart';

class MovieRequest{
  Future<MovieDomain> getPopularMovie(GetPopularMovieUseCaseParams params) async{
    final completer = Completer<MovieDomain>();
    await js.context.callMethod('getPopularMovie', [
      params.page,
          (message) {
        completer.complete(message);
      }
    ]);
    return completer.future;
  }
  Future<MovieTrailerDomain> getMovieTrailer(GetMovieTrailerUseCaseParams params) async{
    final completer = Completer<MovieTrailerDomain>();
    await js.context.callMethod('getMovieTrailer', [
      params.movieId,
          (message) {
        completer.complete(message);
      }
    ]);
    return completer.future;
  }
}