import 'package:flutter/material.dart';
import 'package:newfluttermovieapp/presentation/model/movie_trailer_item.dart';
import 'package:newfluttermovieapp/presentation/utils/strings.dart';
import 'app_launcher.dart';


class TrailerLayout extends StatelessWidget {
  final List<TrailerItem> trailerData;
  final String trailerThumbNail;

  TrailerLayout({@required this.trailerData, this.trailerThumbNail})
      : assert(trailerData != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      child: OrientationBuilder(builder: (context, orientation) {
        return new ListView.builder(
          itemCount: trailerData.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final items = trailerData[index];
            return InkWell(
              onTap: () {
                String url = '${StaticStrings.youtubeBaseUrl}${items.trailerKey}';
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AppLauncher(
                          url: url, trailerName: items.trailerName);
                    },
                  ),
                );
                //todo pass the arguments as class
                // Navigator.of(context).pushNamed(MovieLandingRoutePaths.Movie, arguments: );
              },
              child: Container(
                width: 170.0,
                margin: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(
                        height: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              '${StaticStrings.imageAppendUrl}$trailerThumbNail',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.play_circle_filled,
                            color: Colors.white,
                            size: 35.0,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text('${items.trailerName}',
                      // items.trailerName,
                      maxLines: 1,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
