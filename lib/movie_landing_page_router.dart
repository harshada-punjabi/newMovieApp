import 'package:flutter/widgets.dart';
import 'package:newfluttermovieapp/presentation/movie_list/movie_list_view.dart';
import 'package:newfluttermovieapp/presentation/movie_list/params/movie_list_param.dart';
import 'package:newfluttermovieapp/presentation/movie_list/widgets/app_launcher.dart';

import 'package:page_transition/page_transition.dart';

import 'movie_landing_page_route_path.dart';

class MovieLandingRouter {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MovieLandingRoutePaths.Landing:
        // MovieListParams params;
        return PageTransition(
          // child: Container(),
          child: MovieListView(),
          settings: RouteSettings(name: MovieLandingRoutePaths.Landing),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 450),
        );
      break;
      case MovieLandingRoutePaths.Movie:
        return PageTransition(
          // child: ContactView(),
          child: AppLauncher(url: '', trailerName: '',),
          settings: RouteSettings(name: MovieLandingRoutePaths.Movie),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 450),
        );
        break;

    }
  }
}
