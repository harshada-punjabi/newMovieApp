

import 'dart:async';

import 'package:flutter_base_architecture/data/remote/rest_service.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/end_points.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/request/movie_landing_request.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/response/movie_response.dart';
import 'package:newfluttermovieapp/domain/usecase/get_movie_trailer_usecase.dart';

import 'package:newfluttermovieapp/domain/usecase/get_popular_movie_usecase.dart';

import '../api_indentifiers.dart';

class MovieRequest extends MovieLandingRestRequest{
  MovieRequest(RESTService service) : super(service);

  Future getPopularMovie({GetPopularMovieUseCaseParams params}) async {
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
    print('the end point${Endpoint.POPULAR_MOVIE}');
    return await execute(Endpoint.POPULAR_MOVIE, params,
        RESTService.GET, ApiIdentifier.API_POPULAR_MOVIE,forceRefresh: true);
  }

//todo change the method content
  Future getMovieTrailer({GetMovieTrailerUseCaseParams params}) async {
    Map<String, dynamic> paramsMap = Map();
    paramsMap.putIfAbsent("api_key", () {
      return '802b2c4b88ea1183e50e6b285a27696e';
    });
    paramsMap.putIfAbsent("language", () {
      return 'en-US';
    });
    paramsMap.putIfAbsent("page", () {
      return '1';
    });
    print('the end point trailer${Endpoint.MOVIE_TRAILER}');
    return await execute(params.movieId.toString()+Endpoint.MOVIE_TRAILER, paramsMap,
        RESTService.GET, ApiIdentifier.API_MOVIE_TRAILER,forceRefresh: true);
  }


}