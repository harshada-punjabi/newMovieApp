

import 'dart:async';

import 'package:flutter_base_architecture/data/remote/rest_service.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/end_points.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/request/movie_landing_request.dart';

import 'package:newfluttermovieapp/domain/usecase/get_popular_movie_usecase.dart';

import '../api_indentifiers.dart';

class MovieRequest extends MovieLandingRestRequest{
  MovieRequest(RESTService service) : super(service);

  /*Future<MovieDomain> getPopularMovie(GetPopularMovieUseCaseParams params) async{
    final completer = Completer<MovieDomain>();
    await js.context.callMethod('getPopularMovie', [
      params.page,
          (message) {
        completer.complete(message);
      }
    ]);
    return completer.future;
  }*/
  // Future<MovieTrailerDomain> getMovieTrailer(GetMovieTrailerUseCaseParams params) async{
  //   final completer = Completer<MovieTrailerDomain>();
  //   await js.context.callMethod('getMovieTrailer', [
  //     params.movieId,
  //         (message) {
  //       completer.complete(message);
  //     }
  //   ]);
  //   return completer.future;
  // }
  Future getPopularMovie(GetPopularMovieUseCaseParams params) async {
    Map<String, dynamic> params = Map();
    params.putIfAbsent("api_key", () {
      return '802b2c4b88ea1183e50e6b285a27696e';
    });
    params.putIfAbsent("language", () {
      return 'en-US';
    });
    params.putIfAbsent("page", () {
      return '1';
    });
    print('the end point${Endpoint.POPULAR_Movie}');
    return await execute(Endpoint.POPULAR_Movie, params,
        RESTService.GET, ApiIdentifier.API_POPULAR_MOVIE,forceRefresh: true);
  }

 }