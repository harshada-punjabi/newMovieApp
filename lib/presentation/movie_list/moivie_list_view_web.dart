import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';
import 'package:newfluttermovieapp/presentation/movie_list/widgets/bottom_loading_indicator.dart';
import 'package:newfluttermovieapp/presentation/movie_list/widgets/movie_list_widget.dart';

import 'movie_list_viewmodel.dart';

class MovieListViewWeb extends MovieBaseModelWidget<MovieListViewModel> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  final List<MovieDomain>? movieList;
  MovieListViewWeb(this.movieList);
  @override
  void initState() {

    _scrollController.addListener(_onScroll);
    print('initState MovieListScreen');
  }
  @override
  Widget buildContent(BuildContext context, MovieListViewModel model) {
    return OrientationBuilder(builder: (context, orientation){
     return CustomScrollView(
      controller: _scrollController,
      shrinkWrap: true,
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return MovieListWidget(
                  movieList: movieList![index]);
            },
            childCount: movieList!.length,
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
    });
  }
  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      //todo add the movies of next page
    }
  }
}
