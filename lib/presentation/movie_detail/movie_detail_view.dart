import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/responsive/orientation_layout.dart';
import 'package:flutter_base_architecture/responsive/screen_type_layout.dart';
import 'package:newfluttermovieapp/domain/usecase/get_movie_trailer_usecase.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';
import 'package:provider/provider.dart';
import 'package:newfluttermovieapp/presentation/model/movie_item.dart';
import 'movie_detail_view_mobile.dart';
import 'movie_detail_viewmodel.dart';

class MovieDetailScreen extends MovieBaseView<MovieDetailViewModel>  {
  final MovieItem movieItem;
  MovieDetailScreen({this.movieItem}) : assert(movieItem != null);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends MovieViewBaseState<MovieDetailViewModel, MovieDetailScreen> {
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
   movieDetailScreenState() {
     setRequiresLogin(false);
   }



  @override
  Widget buildBody() {
    return ScreenTypeLayout(
      mobile: OrientationLayoutBuilder(
        portrait: (context) => MovieDetailViewMobile(movieItem: widget.movieItem,),
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
   return Color(0xFF181822);
  }
  @override
  void onModelReady(MovieDetailViewModel model) async{
    //todo remove temp id
    await model.getMovieTrailerList(params: GetMovieTrailerUseCaseParams(movieId: widget.movieItem.movieId));
    print('initState MovieDetailScreen');
  }

}



