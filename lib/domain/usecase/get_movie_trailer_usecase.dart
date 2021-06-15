
import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/domain/model/movie_trailer_domain.dart';
import 'package:newfluttermovieapp/domain/repositories/movie_repository.dart';
import 'package:newfluttermovieapp/presentation/model/movie_trailer_item.dart';
import 'base_usecase.dart';

class GetMovieTrailerUseCase extends BaseUseCase<List<TrailerItem>, GetMovieTrailerUseCaseParams>{
  final MovieRepository _repository;
  GetMovieTrailerUseCase(this._repository);
  @override
  Future<List<TrailerItem>> buildUseCaseFuture(
      {@required GetMovieTrailerUseCaseParams params}) async {

    List<TrailerDomain> movieTrailerDomainList  = await _repository.fetchMovieTrailer(params: params);

    return movieTrailerDomainList.mapToTrailerListItem();
  }

}

class GetMovieTrailerUseCaseParams {
  final int movieId;
  final int pageNo;


  GetMovieTrailerUseCaseParams(
      {
        this.movieId = 1,
        this.pageNo = 1,
      });
}