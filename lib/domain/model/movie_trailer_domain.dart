
import 'package:newfluttermovieapp/presentation/model/movie_trailer_item.dart';

class TrailerDomain {
  String trailerKey;
  String trailerName;
  String trailerSite;
  int trailerSize;

  TrailerDomain({
    this.trailerKey,
    this.trailerName,
    this.trailerSite,
    this.trailerSize,
  });

  static List<TrailerDomain> movieTrailer(Map<String, dynamic> json) {
    final jsonArray = json['results'];
    final list = <TrailerDomain>[];
    for (final item in jsonArray) {
      TrailerDomain movieTrailer = TrailerDomain();
      movieTrailer.trailerKey = item['key'];
      movieTrailer.trailerName = item['name'];
      movieTrailer.trailerSite = item['site'];
      movieTrailer.trailerSize = item['size'];
      list.add(movieTrailer);
    }
    return list;
  }
}

extension MovieTrailerExtention on TrailerDomain {
  TrailerItem mapToMovieTrailerPresentation() =>
      TrailerItem(
        trailerKey: this.trailerKey,
        trailerName: this.trailerName,
        trailerSite: this.trailerSite,
        trailerSize: this.trailerSize,

      );

}
extension MovieListExtension on List<TrailerDomain> {
  List<TrailerItem> mapToTrailerListItem() =>
      map((e) => e.mapToMovieTrailerPresentation()).toList();
}