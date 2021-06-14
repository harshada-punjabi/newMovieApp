import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';
import 'package:newfluttermovieapp/domain/repositories/movie_repository.dart';
import 'package:newfluttermovieapp/presentation/model/movie_item.dart';

import 'base_usecase.dart';

class GetPopularMovieUseCase
    extends BaseUseCase<List<MovieItem>, GetPopularMovieUseCaseParams> {
  final MovieRepository _repository;

  GetPopularMovieUseCase(this._repository);

  @override
  Future<List<MovieItem>> buildUseCaseFuture(
      {GetPopularMovieUseCaseParams params}) async {
    List<MovieDomain> movieDomainList =
        await _repository.fetchPopularMovie(params: params);
    return movieDomainList.mapToMovieListItem();
  }
}

class GetPopularMovieUseCaseParams {
  int pageNo = 1;

  GetPopularMovieUseCaseParams({
    this.pageNo,
  });
}
