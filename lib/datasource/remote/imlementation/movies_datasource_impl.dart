


import 'package:flutter_base_architecture/exception/base_error.dart';
import 'package:newfluttermovieapp/datasource/datasources/movies_datasource.dart';
import 'package:newfluttermovieapp/datasource/entity/movie_entity.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/request/movie_request.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/response/movie_response.dart';
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';
import 'package:newfluttermovieapp/domain/model/movie_trailer_domain.dart';
import 'package:newfluttermovieapp/domain/usecase/get_movie_trailer_usecase.dart';
import 'package:newfluttermovieapp/domain/usecase/get_popular_movie_usecase.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';

class MoviesDataSourceImpl extends MovieListDataSource {
  // final MailRequest _mailRequest;
  final MovieRequest _movieRequest;

  MoviesDataSourceImpl(this._movieRequest);



 /* @override
  Future<MovieDomain> getPopularMovie(GetPopularMovieUseCaseParams params) async{
    try {
      var getmovie = await  _movieRequest.getPopularMovie(params);
      print(getmovie);
      if (getmovie == null) {
        throw MovieLandingError(
            type: MovieLandingErrorType.RECAPTCHA_VERIFICATION_FAILED);
      }
    } catch (exception) {
      print("Exception occured ${exception.toString()}");
      if (exception is MovieLandingError) {
        switch (exception.type) {
          case MovieLandingErrorType.RECAPTCHA_VERIFICATION_FAILED:
            throw MovieLandingError(
                type: MovieLandingErrorType.RECAPTCHA_VERIFICATION_FAILED);
          default:
            throw MovieLandingError(
                type: MovieLandingErrorType.SERVER_MESSAGE);
        }
      }
      throw MovieLandingError(
          type: MovieLandingErrorType.SERVER_MESSAGE);
    }
    throw MovieLandingError(
        type: MovieLandingErrorType.SERVER_MESSAGE);
  }
*/
  // @override
  // Future<List<MovieTrailerDomain>> getMovieTrailer( params) {
  //   // TODO: implement getMovieTrailer
  //   throw UnimplementedError();
  // }


  //always use domain class from datasource
  @override
  Future<List<MovieDomain>> getPopularMovie(
      {GetPopularMovieUseCaseParams params}) async{
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
    }
    else {
      return movieResponse.getData().mapToDomain();
    }
    // return response;
  }
}
