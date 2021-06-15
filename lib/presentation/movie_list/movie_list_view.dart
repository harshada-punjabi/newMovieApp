import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';
import 'moivie_list_view_mobile.dart';
import 'movie_list_viewmodel.dart';
import 'package:provider/provider.dart';


class MovieListView extends MovieBaseView<MovieListViewModel> {

  MovieListView();
// final MovieListParams movieListParams;
  @override
  MovieListViewState createState() => MovieListViewState();
}

class MovieListViewState
    extends MovieViewBaseState<MovieListViewModel, MovieListView> {

  MovieListViewState() {
    setRequiresLogin(false);
  }

  @override
  Widget buildBody() {
    return MovieListViewMobile();
  }
@override
  void onModelReady(MovieListViewModel model) async{
    //widget is created
  model.scrollController.addListener(onScroll);
   await model.getPopularMovieList();
  print('initState MovieListScreen');


  }
  @override
  MovieListViewModel initViewModel() {
    // return MovieListViewModel(Provider.of<GetPopularMovieUseCase>(context));
    return MovieListViewModel(Provider.of(context));
  }
  void onScroll() {
    final maxScroll = getViewModel().scrollController.position.maxScrollExtent;
    final currentScroll = getViewModel().scrollController.position.pixels;
    if (maxScroll - currentScroll <= getViewModel().scrollThreshold) {
     // todo add the movies of next page
    }
  }

  @override
  Color statusBarColor() {
    return Color(0xFF181822);
  }
}
