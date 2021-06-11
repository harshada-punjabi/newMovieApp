import 'package:dio/dio.dart';
import 'package:flutter_base_architecture/data/remote/request/rest_request.dart';
import 'package:flutter_base_architecture/data/remote/rest_service.dart';
import 'package:newfluttermovieapp/presentation/utils/strings.dart';

abstract class MovieLandingRestRequest extends RESTRequest {
  RESTService service;
 static const int page = 1;

  MovieLandingRestRequest(this.service,
      {apiUrl = 'http://api.themoviedb.org/3/movie/',
        schema: "http",
        host: "api.themoviedb.org"}
      )
      : super(
    service,
    apiUrl: apiUrl,
    schema: schema,
    host: host,
  ) {
    this.service = service;
  }

  @override
  Future<Response> execute(dynamic page, Map<String, dynamic> params,
      int apiCallMethod, int apiIdentifier,
      {forceRefresh: false}) async {
    return await super
        .execute(page.toString(), params, apiCallMethod, apiIdentifier,
        forceRefresh: forceRefresh)
        .then((value) => value, onError: (e) {});
  }
}
