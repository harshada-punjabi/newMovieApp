import 'package:flutter_base_architecture/exception/base_error.dart';
import 'package:newfluttermovieapp/datasource/datasources/movies_datasource.dart';
import 'package:newfluttermovieapp/datasource/entity/movie_entity.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/request/movie_request.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/response/movie_response.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/response/trailer_response.dart';
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';
import 'package:newfluttermovieapp/domain/model/movie_trailer_domain.dart';
import 'package:newfluttermovieapp/domain/usecase/get_movie_trailer_usecase.dart';
import 'package:newfluttermovieapp/domain/usecase/get_popular_movie_usecase.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';
import 'package:newfluttermovieapp/datasource/entity/trailer_entity.dart';

class MoviesDataSourceImpl extends MovieDataSource {
  final MovieRequest _movieRequest;

  MoviesDataSourceImpl(this._movieRequest);

  @override
  Future<List<MovieDomain>> getPopularMovie(
      {GetPopularMovieUseCaseParams params}) async {
    try{
    var response = await _movieRequest.getPopularMovie(getPopularMovieUseCaseParams: params);
    MovieResponse movieResponse = MovieResponse(response);
    if (movieResponse.getErrors().length != 0) {
     throw MovieLandingError(
          message: movieResponse.getErrorString(),
          type: MovieLandingErrorType.SERVER_MESSAGE);
    } else {
      return movieResponse.getData().mapToDomain();
    }
    } catch(exception){
     throw MovieLandingError(
          message: exception.toString(),
          type: MovieLandingErrorType.SERVER_MESSAGE);
    }
  }

  @override
  Future<List<TrailerDomain>> getMovieTrailer(
      {GetMovieTrailerUseCaseParams params}) async {
    try{
    var response = await _movieRequest.getMovieTrailer(getMovieTrailerUseCaseParams: params);
    TrailerResponse trailerResponse = TrailerResponse(response);
    if (trailerResponse.getErrors().length != 0) {
      throw MovieLandingError(
          message: trailerResponse.getErrorString(),
          type: MovieLandingErrorType.SERVER_MESSAGE);
    } else {
      return trailerResponse.getData().mapToTrailerDomain();
    }
    }catch(exception){
      throw MovieLandingError(
          message: exception.toString(),
          type: MovieLandingErrorType.SERVER_MESSAGE);
    }
  }
}
