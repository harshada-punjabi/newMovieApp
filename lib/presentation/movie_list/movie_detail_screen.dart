import 'package:flutter/material.dart';

import 'package:newfluttermovieapp/presentation/model/movie_item.dart';
import 'package:newfluttermovieapp/presentation/movie_list/widgets/app_state_container.dart';
import 'package:newfluttermovieapp/presentation/movie_list/widgets/movie_detail_app_bar.dart';
import 'package:newfluttermovieapp/presentation/movie_list/widgets/movie_detail_description.dart';
import 'package:newfluttermovieapp/presentation/utils/app_colors.dart';

import 'widgets/trailer_layout_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieItem movieItem;
  MovieDetailScreen({this.movieItem}) : assert(movieItem != null);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
   // MovieTrailerBloc _movieTrailerBloc;
   ScrollController _scrollController;

  bool lastStatus = true;

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
  //
  // @override
  // void didChangeDependencies() {
  //   _movieTrailerBloc = MovieTrailerBlocProvider.of(context)
  //     ..add(FetchMovieTrailer(movieId: widget.movieList!.movieId));
  //   super.didChangeDependencies();
  // }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  // Link:- https://flutter-widget.live/widgets/NestedScrollView
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                              // Flexible(
                              //   child: TrailerLayout(
                              //       trailerData:
                              //       ,
                              //       trailerThumbNail:
                              //       widget.movieItem.posterImg),
                              // ),
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


}
