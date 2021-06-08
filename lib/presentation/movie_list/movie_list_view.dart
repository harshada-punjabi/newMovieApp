import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_base_architecture/responsive/orientation_layout.dart';
import 'package:flutter_base_architecture/responsive/screen_type_layout.dart';
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';

import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';
import 'package:provider/provider.dart';

import 'moivie_list_view_web.dart';
import 'movie_list_viewmodel.dart';


class MovieListView extends MovieBaseView<MovieListViewModel> {
  @override
  MovieListViewState createState() => MovieListViewState();
}

class MovieListViewState
    extends MovieViewBaseState<MovieListViewModel, MovieListView> {

  LandingViewState(){
    setRequiresLogin(false);
  }
List<MovieDomain> movileList =[];
  @override
  Widget buildBody() {
    return ScreenTypeLayout(
      mobile: OrientationLayoutBuilder(
        portrait: (context) => MovieListViewWeb(movileList),
      ),
    );
  }

  @override
  MovieListViewModel initViewModel() {
    return MovieListViewModel();
  }

  @override
  String widgetErrorMessage() {
    // TODO: implement widgetErrorMessage
    throw UnimplementedError();
  }
}
