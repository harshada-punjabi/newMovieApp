import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/domain/model/movie_domain.dart';
import 'package:newfluttermovieapp/presentation/utils/strings.dart';

import 'app_state_container.dart';

class MovieListWidget extends StatelessWidget {
  MovieListWidget({Key? key,  this.movieList})
      : assert(movieList != null),
        super(key: key);

  final MovieDomain? movieList;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppStateContainer.of(context).theme.primaryColor,
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return MovieTrailerBlocProvider(
          //         child: MovieDetailScreen(movieList: movieList),
          //       );
          //     },
          //   ),
          // );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage(StaticStrings.placeHolderImgPath),
                image: NetworkImage(
                  '${StaticStrings.imageAppendUrl}${movieList!.posterImg}',
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Text(
                '${movieList!.title}',
                key: Key('movie_title_text'),
                style: TextStyle(
                  color: AppStateContainer.of(context).theme.accentColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
