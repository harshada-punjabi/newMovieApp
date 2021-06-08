

import 'package:newfluttermovieapp/domain/model/movie_trailer_domain.dart';
import 'package:newfluttermovieapp/domain/repositories/movie_repository.dart';
import 'package:newfluttermovieapp/presentation/utils/strings.dart';

import 'base_usecase.dart';

class GetPopularMovieUseCase extends BaseUseCase<List<MovieTrailerDomain>, GetMovieTrailerUseCaseParams>{
  final MovieRepository _repository;
  GetPopularMovieUseCase(this._repository);
  @override
  Future<List<MovieTrailerDomain>> buildUseCaseFuture(
      {required GetMovieTrailerUseCaseParams params}) async {
    return _repository.fetchMovieTrailer();
  }

}

class GetMovieTrailerUseCaseParams {
  final int movieId;


  GetMovieTrailerUseCaseParams(
      {this.movieId = 1,
        });
}