import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/domain/usecase/get_movie_trailer_usecase.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';
import 'package:provider/provider.dart';

import 'package:newfluttermovieapp/presentation/model/movie_item.dart';
import 'package:newfluttermovieapp/presentation/movie_list/widgets/movie_detail_app_bar.dart';
import 'package:newfluttermovieapp/presentation/movie_list/widgets/movie_detail_description.dart';
import 'movie_detail_viewmodel.dart';
import 'widgets/trailer_layout_widget.dart';

class MovieDetailScreen extends MovieBaseView<MovieDetailViewModel>  {
  final MovieItem movieItem;
  MovieDetailScreen({this.movieItem}) : assert(movieItem != null);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends MovieViewBaseState<MovieDetailViewModel, MovieDetailScreen> {
   ScrollController _scrollController;

  bool lastStatus = true;

   MovieDetailScreenState() {
     setRequiresLogin(false);
   }
  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }


  // Link:- https://flutter-widget.live/widgets/NestedScrollView

  @override
  Widget buildBody() {
    Scaffold(

      // backgroundColor: AppStateContainer.of(context).theme.primaryColor,
      backgroundColor: Color(0xFF181822).withOpacity(0.9),
      body: SafeArea(
        top: false,
        bottom: false,
        child: OrientationBuilder(builder: (context, orientation) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              MovieDetailAppBar(
                movieList: widget.movieItem,
                isShrink: isShrink,
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverFillViewport(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              MovieDetailDescription(
                                movieList: widget.movieItem,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Flexible(
                                child: TrailerLayout(
                                    trailerData:
                                    getViewModel().trailerList,
                                    trailerThumbNail:
                                    widget.movieItem.posterImg),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: 1,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  @override
  MovieDetailViewModel initViewModel() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    return MovieDetailViewModel(Provider.of(context));
  }

  @override
  Color statusBarColor() {
    Color(0xFF181822);
  }
  @override
  void onModelReady(MovieDetailViewModel model) async{
    //todo remove temp id
    await model.getMovieTrailerList(params: GetMovieTrailerUseCaseParams(movieId: widget.movieItem.movieId));
    print('initState MovieDetailScreen');
  }

}
