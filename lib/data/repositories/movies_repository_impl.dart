
import 'package:newfluttermovieapp/datasource/datasources/movies_datasource.dart';
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';
import 'package:newfluttermovieapp/domain/model/movie_trailer_domain.dart';
import 'package:newfluttermovieapp/domain/repositories/movie_repository.dart';
import 'package:newfluttermovieapp/domain/usecase/get_movie_trailer_usecase.dart';
import 'package:newfluttermovieapp/domain/usecase/get_popular_movie_usecase.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieListDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  // @override
  // Future<List<MovieTrailerDomain>> fetchMovieTrailer( params) {
  //  return dataSource.getMovieTrailer(params);
  // }

  @override
  Future<List<MovieDomain>> fetchPopularMovie(GetPopularMovieUseCaseParams params) {
    return dataSource.getPopularMovie(params);
  }
}