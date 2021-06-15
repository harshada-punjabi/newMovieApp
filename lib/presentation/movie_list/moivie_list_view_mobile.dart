import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';
import 'package:newfluttermovieapp/presentation/movie_list/widgets/bottom_loading_indicator.dart';
import 'package:newfluttermovieapp/presentation/movie_list/widgets/movie_list_widget.dart';

import 'movie_list_viewmodel.dart';

class MovieListViewMobile extends MovieBaseModelWidget<MovieListViewModel> {
  MovieListViewMobile();

  @override
  Widget buildContent(BuildContext context, MovieListViewModel model) {
    return Scaffold(
      backgroundColor:  Color(0xFF181822),
      body: OrientationBuilder(builder: (context, orientation){
       return CustomScrollView(
        controller: model.scrollController,
        shrinkWrap: true,
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return MovieListWidget(
                    movieList: model.movieList[index]);
              },
              childCount: model.movieList.length,
            ),
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
              orientation == Orientation.portrait ? 2 : 3,
              childAspectRatio: 0.55,
            ),
          ),
          SliverToBoxAdapter(
            child: BottomLoadingIndicator(),
          )
        ],
      );
      }),
    );
  }

}
