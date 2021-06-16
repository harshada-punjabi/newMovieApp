
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';
import 'package:newfluttermovieapp/domain/model/movie_trailer_domain.dart';
import 'package:newfluttermovieapp/domain/usecase/get_movie_trailer_usecase.dart';
import 'package:newfluttermovieapp/domain/usecase/get_popular_movie_usecase.dart';

abstract class MovieDataSource{
  Future<List<MovieDomain>> getPopularMovie(
      {GetPopularMovieUseCaseParams params});
  Future<List<TrailerDomain>> getMovieTrailer({GetMovieTrailerUseCaseParams params});
}