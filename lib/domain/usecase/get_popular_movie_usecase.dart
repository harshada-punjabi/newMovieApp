

import 'package:newfluttermovieapp/domain/model/movie_domain.dart';
import 'package:newfluttermovieapp/domain/repositories/movie_repository.dart';
import 'package:newfluttermovieapp/presentation/utils/strings.dart';

import 'base_usecase.dart';

class GetPopularMovieUseCase extends BaseUseCase<MovieDomain, GetPopularMovieUseCaseParams>{
  final MovieRepository _repository;
  GetPopularMovieUseCase(this._repository);
  @override
  Future<MovieDomain> buildUseCaseFuture(
      {required GetPopularMovieUseCaseParams params}) async {
    return _repository.fetchPopularMovie(params);
  }

}

class GetPopularMovieUseCaseParams {
  final int page;


  GetPopularMovieUseCaseParams(
      {this.page = 1,
        });
}