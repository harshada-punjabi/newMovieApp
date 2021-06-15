import 'package:dio/src/response.dart';
import 'package:newfluttermovieapp/datasource/entity/maps_extensions.dart';
import 'package:newfluttermovieapp/datasource/entity/movie_entity.dart';
import 'package:newfluttermovieapp/datasource/entity/trailer_entity.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/response/movie_landing_response.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';
import '../api_indentifiers.dart';

//todo change the class content

class TrailerResponse extends MovieLandingResponse<TrailerEntity> {
  TrailerResponse(Response response) : super(response);

  @override
  parseResponseData(data, int apiIdentifier) {

    switch (apiIdentifier) {
      case ApiIdentifier.API_MOVIE_TRAILER:
        try {
          var responseData = data as Map<String, dynamic>;
          var list = responseData.getOrElse("results", List()) as List<dynamic>;
          List<TrailerEntity> trailerEntity = list.map((json) {
            return TrailerEntity.fromJson(json);
          }).toList();
          getData().addAll(trailerEntity);
        }
        catch (exception) {
          getErrors().add(MovieLandingError(
              message: exception.toString(),
              type: MovieLandingErrorType.INVALID_RESPONSE));
        }
        break;
    }
  }
}