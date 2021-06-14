
import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/response/movie_response.dart';
import 'package:newfluttermovieapp/domain/usecase/get_popular_movie_usecase.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';
import 'package:newfluttermovieapp/presentation/model/movie_item.dart';

class MovieListViewModel extends MovieLandingBaseViewModel {
  //network call
GetPopularMovieUseCase _getPopularMovieUseCase;

MovieListViewModel(this._getPopularMovieUseCase);
  List<MovieItem> _movieList = [];
final scrollController = ScrollController();
  final scrollThreshold = 200.0;

  List<MovieItem> get movieList => _movieList;

  set movieList(List<MovieItem> value) {
    _movieList = value;
    notifyListeners();
  }
  Future<void> getPopularMovieList() async {
    //if the data is loading
    setBusy(true);
    final List<MovieItem> result = await _getPopularMovieUseCase
        .buildUseCaseFuture()
        .catchError((error) {
      print("error> ${error.toString()}");
      movieList.clear();

      setBusy(false);
    }, test: (error) => error is MovieLandingError);
    _movieList = [];
    if (result != null) {
      movieList.addAll(result);
      print('length of the movie list is as follows ${movieList.length}');
    }
    setBusy(false);
    // return result;
  }


}
