import 'package:dio/src/response.dart';
import 'package:newfluttermovieapp/datasource/entity/movie_entity.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/response/movie_landing_response.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';
import '../api_indentifiers.dart';



class MovieResponse extends MovieLandingResponse<MovieEntity> {
  MovieResponse(Response response) : super(response);

  @override
  parseResponseData(data, int apiIdentifier) {
    switch (apiIdentifier) {
      case ApiIdentifier.API_POPULAR_MOVIE:
        try {
          var entity = MovieEntity.fromJson(data);
          getData().add(entity);
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