import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_base_architecture/responsive/orientation_layout.dart';
import 'package:flutter_base_architecture/responsive/screen_type_layout.dart';
import 'package:newfluttermovieapp/di/providers.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';
import 'package:newfluttermovieapp/presentation/movie_list/params/movie_list_param.dart';
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
    return ScreenTypeLayout(
      mobile: OrientationLayoutBuilder(
        portrait: (context) => MovieListViewMobile(),
      ),
    );
  }
@override
  void onModelReady(MovieListViewModel model) {
    //widget is created
  // model.scrollController.addListener(_onScroll);
  print('initState MovieListScreen');

  }
  @override
  MovieListViewModel initViewModel() {
    return MovieListViewModel();
  }
  void _onScroll() {
    final maxScroll = getViewModel().scrollController.position.maxScrollExtent;
    final currentScroll = getViewModel().scrollController.position.pixels;
    // if (maxScroll - currentScroll <= _scrollThreshold) {
      //todo add the movies of next page
    // }
  }

  @override
  Color statusBarColor() {
    return Colors.green;
  }
}
