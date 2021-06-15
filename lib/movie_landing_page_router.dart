import 'package:flutter/widgets.dart';
import 'package:newfluttermovieapp/presentation/movie_list/movie_list_view.dart';
import 'package:page_transition/page_transition.dart';

import 'movie_landing_page_route_path.dart';
import 'presentation/movie_detail/movie_detail_view.dart';

class MovieLandingRouter {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MovieLandingRoutePaths.Landing:
        return PageTransition(
          child: MovieListView(),
          settings: RouteSettings(name: MovieLandingRoutePaths.Landing),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 450),
        );
      break;
      case MovieLandingRoutePaths.MovieDetail:
        return PageTransition(
          child: MovieDetailScreen(movieItem: settings.arguments,),
          settings: RouteSettings(name: MovieLandingRoutePaths.MovieDetail),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 450),
        );
        break;

    }
  }
}
