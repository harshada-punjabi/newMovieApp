import 'package:flutter/material.dart';

import 'package:newfluttermovieapp/domain/model/movie_domain.dart';
import 'package:newfluttermovieapp/presentation/model/movie_item.dart';

import 'app_state_container.dart';


class MovieDetailDescription extends StatelessWidget {
  final MovieItem movieList;
  MovieDetailDescription({ this.movieList}) : assert(movieList != null);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${movieList.title}',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white
                .withOpacity(0.8),
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Text(
                    // '${movieList.vote}',
                    // todo:temp static value.it is null need to check

                  '2.4',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Release Date: ${movieList.releaseDate}',
              textAlign: TextAlign.end,
              style: TextStyle(
                 color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0),
            ),
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '${movieList.overview}',
          style: TextStyle(
             color: Colors.white,
              // fontWeight: FontWeight.bold,
              fontSize: 17.0),
        ),
        SizedBox(
          height: 15.0,
        ),
        // Text(
        //   'Trailer',
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 22.0,
        //   ),
        // ),
      ],
    );
  }
}
