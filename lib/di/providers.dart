
import 'package:flutter_base_architecture/data/local/sharedpreferences/user_stores.dart';
import 'package:flutter_base_architecture/data/remote/rest_service.dart';
import 'package:flutter_base_architecture/exception/base_error_handler.dart';
import 'package:newfluttermovieapp/data/repositories/movies_repository_impl.dart';
import 'package:newfluttermovieapp/datasource/datasources/movies_datasource.dart';
import 'package:newfluttermovieapp/datasource/local/movie_app_user_store.dart';
import 'package:newfluttermovieapp/datasource/remote/imlementation/movies_datasource_impl.dart';
import 'package:newfluttermovieapp/datasource/remote/providers/rest/request/movie_request.dart';
import 'package:newfluttermovieapp/domain/model/user_domain.dart';
import 'package:newfluttermovieapp/domain/repositories/movie_repository.dart';
import 'package:newfluttermovieapp/domain/usecase/get_movie_trailer_usecase.dart';
import 'package:newfluttermovieapp/domain/usecase/get_popular_movie_usecase.dart';
import 'package:newfluttermovieapp/presentation/base/view/movie_landing_base_view.dart';
import 'package:newfluttermovieapp/presentation/model/user_item.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  // ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  Provider(create: (_)=> MovieAppStore()),
  Provider(create:(_)=> MovieLandingErrorParser()),
  Provider(create: (_) => RESTService()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<MovieLandingErrorParser, ErrorHandler<MovieLandingErrorParser>>(
    update: (context, errorParser, errorHandler) =>
        ErrorHandler<MovieLandingErrorParser>(errorParser),
  ),
  ProxyProvider<MovieAppStore, UserStore<UserDomain>>(
    update: (
        context,
        localStore,
        userStore,
        ) =>
    localStore,
  ),

  ///Movie Repository
  ProxyProvider<RESTService, MovieRequest>(
    update: (context, RESTService restService,
        MovieRequest reCaptchaRequest) =>
        MovieRequest(restService),
  ),
  ProxyProvider<MovieRequest, MovieListDataSource>(
    update: (context, movieRequest, dataSource) =>
        MoviesDataSourceImpl(movieRequest),
  ),
  ProxyProvider<MovieListDataSource, MovieRepository>(
    update: (context, dataSource, repository) =>
        MovieRepositoryImpl(dataSource),
  ),
  ProxyProvider<MovieRepository, GetPopularMovieUseCase>(
    update: (context, MovieRepository movieRepository,
        GetPopularMovieUseCase getPopularMovieUseCase) =>
        GetPopularMovieUseCase(movieRepository),
  ),

];
// List<SingleChildWidget> uiConsumableProviders = [
// StreamProvider<UserItem>(
// initialData: UserItem(),
// create: (context) =>
// Provider.of<MovieAppStore>(context, listen: false).userStream,
// ),];