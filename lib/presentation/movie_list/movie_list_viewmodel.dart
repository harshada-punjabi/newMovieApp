
import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/domain/usecase/get_popular_movie_usecase.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';
import 'package:newfluttermovieapp/presentation/model/movie_item.dart';

class MovieListViewModel extends MovieLandingBaseViewModel {
  //network call
GetPopularMovieUseCase _getPopularMovieUseCase;
MovieListViewModel();
// MovieListViewModel(this._getPopularMovieUseCase);
  List<MovieItem> _movieList = [];
final scrollController = ScrollController();

  List<MovieItem> get movieList => _movieList;

  set movieList(List<MovieItem> value) {
    _movieList = value;
    notifyListeners();
  }
  Future<dynamic> getPopularMovieList() async {
    //if the data is loading
    setBusy(true);
    final List<MovieItem> result = await _getPopularMovieUseCase
        .buildUseCaseFuture()
        .catchError((error) {
      print("error> ${error.toString()}");
      movieList.clear();

      setBusy(false);
    }, test: (error) => error);
    _movieList = [];
    if (result != null) {
      movieList.addAll(result);
    }
    setBusy(false);
    return result;
  }


}
