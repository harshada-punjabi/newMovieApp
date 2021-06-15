import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/movie_landing_page_route_path.dart';
import 'package:newfluttermovieapp/presentation/model/movie_item.dart';
import 'package:newfluttermovieapp/presentation/utils/strings.dart';


double homeHeadershrinkFactor = 1;
double homeHeadershrinkFactorEnhanced = 1;

class MovieListWidget extends StatelessWidget {
  MovieListWidget({Key key,  this.movieList})
      : assert(movieList != null),
        super(key: key);

  final MovieItem movieList;
  @override
  Widget build(BuildContext context) {
    return Card(
     // color: AppStateContainer.of(context).theme.primaryColor,
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, MovieLandingRoutePaths.MovieDetail, arguments: movieList);
        },
        child: Stack(
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                color: Colors.indigo[900],
                gradient: LinearGradient(
                  colors: [
                    Colors.indigo[800],
                    Colors.indigo[900].withOpacity(0.7),
                    Color(0xFF181822),
                  ],
                  stops: [0, 0.25, homeHeadershrinkFactor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                // border: Border(
                //   bottom: BorderSide(
                //       color: Colors.indigo.withOpacity(0.35), width: 0.5),
                // ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child:
                  Image.network('${StaticStrings.imageAppendUrl}${movieList.posterImg}')

                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    '${movieList.title}',
                    key: Key('movie_title_text'),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white
                          .withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
