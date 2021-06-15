import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/domain/usecase/get_movie_trailer_usecase.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';
import 'package:newfluttermovieapp/presentation/movie_list/widgets/icon_label_circular_border.dart';
import 'package:newfluttermovieapp/presentation/movie_list/widgets/movie_detail_header.dart';
import 'package:provider/provider.dart';
import 'package:newfluttermovieapp/presentation/model/movie_item.dart';
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


  @override
  Widget buildBody() {
    Scaffold(

      backgroundColor: Color(0xFF181822).withOpacity(0.9),
      body: SafeArea(
        top: false,
        bottom: false,
        child: OrientationBuilder(builder: (context, orientation) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: MoviePageSliverHeaderDelegate(movie: widget.movieItem),
              ),
              SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Opacity(
                        opacity: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconLabelContainerBorderCircular(
                                    iconData: Icons.language,
                                    title: 'English',
                                    color: Colors.white.withOpacity(0.75),
                                  ),
                                  IconLabelContainerBorderCircular(
                                    iconData: Icons.favorite,
                                    title: widget.movieItem.vote.toString(),
                                    color: Colors.red.withOpacity(0.75),
                                  ),
                                  IconLabelContainerBorderCircular(
                                    iconData: Icons.star,
                                    title: widget.movieItem.vote.toString(),
                                    color: Colors.amber.withOpacity(0.75),
                                  ),
                                  IconLabelContainerBorderCircular(
                                    iconData: Icons.remove_red_eye,
                                    title: widget.movieItem.vote.toString(),
                                    color: Colors.white.withOpacity(0.75),
                                  ),
                                  IconLabelContainerBorderCircular(
                                    iconData: Icons.remove_red_eye,
                                    title: widget.movieItem.vote.toString(),
                                    color: Colors.white.withOpacity(0.75),
                                  ),
                                ],
                              ),
                              SizedBox(height: 40),
                              Text(
                                'Synopsis',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.05,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                              Container(
                                width: 35,
                                height: 2,
                                color: Colors.white.withOpacity(0.25),
                                margin: const EdgeInsets.symmetric(vertical: 12),
                              ),
                              Text(
                                widget.movieItem.overview,
                                textAlign: TextAlign.justify,
                                maxLines: 20,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                  height: 1.5,
                                  color: Colors.white.withOpacity(0.65),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.05),
                                    // border: Border.all(
                                    //   color: Colors.white.withOpacity(0.35),
                                    //   width: 0.5,
                                    // ),
                                    borderRadius: BorderRadius.circular(4)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                margin: const EdgeInsets.only(bottom: 18, top: 22),
                                child: Text(
                                  'Read More',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 32, bottom: 18, left: 8, right: 16),
                                child: Text(
                                  'Trailer',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white.withOpacity(0.65),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
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
                      ),
                    ],
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
