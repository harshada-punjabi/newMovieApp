


import 'package:newfluttermovieapp/datasource/datasources/movies_datasource.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/request/movie_request.dart';
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';
import 'package:newfluttermovieapp/domain/model/movie_trailer_domain.dart';
import 'package:newfluttermovieapp/domain/usecase/get_movie_trailer_usecase.dart';
import 'package:newfluttermovieapp/domain/usecase/get_popular_movie_usecase.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';

class MoviesDataSourceImpl extends MovieListDataSource {
  // final MailRequest _mailRequest;
  final MovieRequest _movieRequest;

  MoviesDataSourceImpl(this._movieRequest);



  @override
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
    throw UnimplementedError();
  }

  @override
  Future<List<MovieTrailerDomain>> getMovieTrailer(GetMovieTrailerUseCaseParams params) {
    // TODO: implement getMovieTrailer
    throw UnimplementedError();
  }

}
