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
    var response = await _movieRequest.getPopularMovie(params: params);
    MovieResponse movieResponse = MovieResponse(response);
    if (movieResponse.getErrors().length != 0) {
      BaseError baseError = movieResponse.getErrors().first;
      print('error>>> ${movieResponse.getErrors().first}');
      switch (baseError.type) {
        case MovieLandingErrorType.INTERNET_CONNECTIVITY:
          throw MovieLandingError(
              message: movieResponse.getErrorString(),
              type: MovieLandingErrorType.INTERNET_CONNECTIVITY);
        case MovieLandingErrorType.OTHER:
          throw MovieLandingError(
              message: movieResponse.getErrorString(),
              type: MovieLandingErrorType.OTHER);
        default:
          throw MovieLandingError(
              message: movieResponse.getErrorString(),
              type: MovieLandingErrorType.SERVER_MESSAGE);
      }
    } else {
      return movieResponse.getData().mapToDomain();
    }
  }

  @override
  Future<List<TrailerDomain>> getMovieTrailer(
      {GetMovieTrailerUseCaseParams params}) async {
    var response = await _movieRequest.getMovieTrailer(params: params);
    TrailerResponse trailerResponse = TrailerResponse(response);
    if (trailerResponse.getErrors().length != 0) {
      BaseError baseError = trailerResponse.getErrors().first;
      print('error>>> ${trailerResponse.getErrors().first}');
      switch (baseError.type) {
        case MovieLandingErrorType.INTERNET_CONNECTIVITY:
          throw MovieLandingError(
              message: trailerResponse.getErrorString(),
              type: MovieLandingErrorType.INTERNET_CONNECTIVITY);
        case MovieLandingErrorType.OTHER:
          throw MovieLandingError(
              message: trailerResponse.getErrorString(),
              type: MovieLandingErrorType.OTHER);
        default:
          throw MovieLandingError(
              message: trailerResponse.getErrorString(),
              type: MovieLandingErrorType.SERVER_MESSAGE);
      }
    } else {
      return trailerResponse.getData().mapToTrailerDomain();
    }
  }
}
