import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';
import 'package:newfluttermovieapp/presentation/model/movie_item.dart';
import 'package:newfluttermovieapp/presentation/utils/strings.dart';

import 'app_state_container.dart';

class MovieDetailAppBar extends StatelessWidget {
  final bool isShrink;
   final MovieItem movieList;
  MovieDetailAppBar({ this.movieList, @required this.isShrink});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 2.5;
    return SliverAppBar(
      expandedHeight: height,
      floating: true,
      pinned: true,
      snap: true,
      elevation: 50,
      backgroundColor: Color(0xFF181822),
      iconTheme: IconThemeData(
        color: /*isShrink
           // ? AppStateContainer.of(context).theme.accentColor
            : */Colors.white,
      ),
      title: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: isShrink ? 1.0 : 0.0,
        curve: Curves.ease,
        child: Text('${movieList.title}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            softWrap: false,
            style: TextStyle(
              // color: AppStateContainer.of(context).theme.accentColor,
              fontSize: 19.0,
              fontWeight: FontWeight.bold,
            )),
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding:
            const EdgeInsets.only(left: 20.0, bottom: 8.0, right: 8.0),
        centerTitle: false,
        collapseMode: CollapseMode.parallax,
        title: AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: isShrink ? 0.0 : 1.0,
          curve: Curves.ease,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Text(
              '${movieList.title}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              softWrap: false,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
              ),
            ),
          ),
        ),
        background: Image.network('${StaticStrings.imageAppendUrl}${movieList.posterImg}'),
        // background: FadeInImage(
        //   fit: BoxFit.cover,
        //   placeholder: AssetImage(StaticStrings.placeHolderImgPath),
        //   image: NetworkImage(
        //     '${StaticStrings.imageAppendUrl}${movieList.posterImg}',
        //   ),
        // ),
      ),
    );
  }
}
