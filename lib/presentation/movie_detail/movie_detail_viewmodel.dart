import 'package:newfluttermovieapp/domain/usecase/get_movie_trailer_usecase.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';
import 'package:newfluttermovieapp/presentation/model/movie_trailer_item.dart';

class MovieDetailViewModel extends MovieLandingBaseViewModel {
  //network call
  GetMovieTrailerUseCase _getMovieTrailerUseCase;
  MovieDetailViewModel(this._getMovieTrailerUseCase);

  List<TrailerItem> _trailerList = [];
  List<TrailerItem> get trailerList => _trailerList;

  set trailerList(List<TrailerItem> value) {
    _trailerList = value;
    notifyListeners();
  }

  Future<void> getMovieTrailerList({GetMovieTrailerUseCaseParams params}) async {
    //if the data is loading
    setBusy(true);
    final List<TrailerItem> result = await _getMovieTrailerUseCase
        .buildUseCaseFuture(params: params)
        .catchError((error) {
      print("error> ${error.toString()}");
      trailerList.clear();

      setBusy(false);
    }, test: (error) => error is MovieLandingError);
    _trailerList = [];
    if (result != null) {
      trailerList.addAll(result);
      print('length of the movie list is as follows ${trailerList.length}');
    }
    setBusy(false);
    // return result;
  }
}