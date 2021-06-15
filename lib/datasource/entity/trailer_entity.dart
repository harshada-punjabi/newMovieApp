
import 'package:newfluttermovieapp/domain/model/movie_trailer_domain.dart';
import 'maps_extensions.dart';
//todo change the class according to the response
class TrailerEntity {
final  String trailerKey;
final String trailerName;
final  String trailerSite;
final int trailerSize;
  TrailerEntity(
      {this.trailerKey,
        this.trailerName,
        this.trailerSite,
        this.trailerSize,
        });

  factory TrailerEntity.fromJson(Map<String, dynamic> json) {
    return TrailerEntity(
      trailerKey: json.getOrElse('key', ''),
      trailerName: json.getOrElse('name', ''),
      trailerSite: json.getOrElse('site', ''),
      trailerSize: json.getOrElse('size', 0),

    );
  }
}

extension MovieEntityExtention on TrailerEntity {
  TrailerDomain mapTrailerToDomain() => TrailerDomain(
   trailerKey:trailerKey,
    trailerName: trailerName,
    trailerSite: trailerSite,
    trailerSize: trailerSize
  );
}
extension MovieListExtension on List<TrailerEntity> {
  List<TrailerDomain> mapToTrailerDomain() =>
      map((e) => e.mapTrailerToDomain()).toList();
}