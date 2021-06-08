import 'package:dio/src/response.dart';
import 'package:flutter_base_architecture/data/remote/response/rest_response.dart';
import 'package:flutter_base_architecture/exception/base_error.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/dto/movie_landing_error_dto.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';


abstract class MovieLandingResponse<T> extends RESTResponse<T> {
  MovieLandingResponse(Response response) : super(response);

  @override
  parseEncryptedResponse(dynamic encryptedResponse) {
    print("Response Encrypted:" + encryptedResponse.toString());
    parseResponse(encryptedResponse);
  }

  @override
  parseResponse(dynamic response) {
    if (super.response.statusCode != 200) {
      MovieLandingErrorDto errorDto =
      MovieLandingErrorDto.fromJson(response as Map<String, dynamic>);
      getErrors().add(BaseError(
          message: errorDto.errors?.first.toString(),
          type: MovieLandingErrorType.SERVER_MESSAGE));
      return;
    }
    parseResponseData(super.response.data, super.apiIdenfier);
  }

  @override
  parseResponseData(dynamic dataArray, int apiIdentifier) {}
}
