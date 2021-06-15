import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/exception/base_error.dart';
import 'package:flutter_base_architecture/exception/base_error_parser.dart';
import 'package:flutter_base_architecture/ui/base_model_widget.dart';
import 'package:flutter_base_architecture/ui/base_statefulwidget.dart';
import 'package:flutter_base_architecture/ui/base_widget.dart';
import 'package:flutter_base_architecture/viewmodels/base_view_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newfluttermovieapp/domain/model/user_domain.dart';
import 'package:newfluttermovieapp/presentation/utils/app_colors.dart';
import '../../../movie_landing_page_route_path.dart';
import '../movie_landing_ui_manager.dart';

class MovieLandingBaseViewModel extends BaseViewModel {
  bool _dataChanged = false;

  bool get hasDataChanged => _dataChanged;

  set dataChanged(bool value) {
    _dataChanged = value;
  }

  MovieLandingBaseViewModel({busy = false}) : super(busy: busy);
}

abstract class MovieBaseView<VM extends MovieLandingBaseViewModel>
    extends BaseStatefulWidget<VM> {
  MovieBaseView({Key key}) : super(key: key);
}

abstract class MovieViewBaseState<VM extends MovieLandingBaseViewModel,
        T extends MovieBaseView<VM>>
    extends BaseStatefulScreen<VM, T, MovieLandingErrorParser, UserDomain> {
  MovieLandingUIManager _uiManager;

  MovieLandingUIManager get uiManager => _uiManager;
  ThemeData _theme;

  ThemeData get theme => _theme;

  @override
  PreferredSizeWidget buildAppbar() {
    return PreferredSize(
      child: SizedBox.shrink(),
      preferredSize: Size(0, 0),
    );
  }

  void onModelReady(VM model) {
    _uiManager = MovieLandingUIManager.of(context);
    _theme =
        // Provider.of<MovieLandingPageApplicationViewModel>(context).themeData;

    model.onErrorListener((error) {
      showMovieToastMessage(getErrorMessage(error));
    });
  }
  @override
  Future<bool> userIsLoggedIn() async {
    bool status = await super.userIsLoggedIn();
    if (!status) {
      // TODO: Creating a temporary user with no onboarding experience
      await getLoggedInUser();
    }
    return status;
  }
  @override
  Widget getLayout() {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor(),
      ),
      child: BaseWidget<VM>(
          viewModel: getViewModel(),
          onModelReady: onModelReady,
          builder: (BuildContext context, VM model, Widget child) {
            return SafeArea(
              child: Scaffold(
                  backgroundColor: scaffoldColor(),
                  key: scaffoldKey,
                  extendBodyBehindAppBar: extendBodyBehindAppBar(),
                  extendBody: extendBody(),
                  appBar: buildAppbar(),
                  body: buildBody(),
                  bottomNavigationBar: buildBottomNavigationBar(),
                  floatingActionButton: floatingActionButton(),
                  floatingActionButtonLocation: floatingActionButtonLocation(),
                  floatingActionButtonAnimator: floatingActionButtonAnimator(),
                  persistentFooterButtons: persistentFooterButtons(),
                  drawer: drawer(),
                  endDrawer: endDrawer(),
                  bottomSheet: bottomSheet(),
                  resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
                  drawerDragStartBehavior: drawerDragStartBehavior(),
                  drawerScrimColor: drawerScrimColor(),
                  drawerEdgeDragWidth: drawerEdgeDragWidth()),
            );
          }),
    );
  }


  @override
  String onBoardingRoutePath() {
    return MovieLandingRoutePaths.Landing;
  }

  @override
  String widgetErrorMessage() {
    return 'unexpected error';
  }

  @override
  String errorLogo() {
    return '';
  }

  @override
  Color scaffoldColor() {
    return Colors.white;
  }

  bool extendBodyBehindAppBar() {
    return true;
  }

  bool extendBody() {
    return false;
  }
}

class MovieLandingError extends BaseError {
  MovieLandingError({
    message,
    type,
    error,
    stackTrace,
  }) : super(message: message, type: type, error: error);
}

class MovieLandingErrorType extends BaseErrorType {
  const MovieLandingErrorType(value) : super(value);
  static const MovieLandingErrorType INTERNET_CONNECTIVITY =
      const MovieLandingErrorType(1);
  static const MovieLandingErrorType INVALID_RESPONSE =
      const MovieLandingErrorType(2);
  static const MovieLandingErrorType SERVER_MESSAGE =
      const MovieLandingErrorType(3);
  static const MovieLandingErrorType OTHER =
  const MovieLandingErrorType(4);

}

class MovieLandingErrorParser extends BaseErrorParser {
  MovieLandingErrorParser() : super();
}

abstract class MovieBaseModelWidget<VM>
    extends BaseModelWidget<VM, MovieLandingErrorParser> {
  MovieLandingUIManager _uiManager;

  MovieLandingUIManager get uiManager => _uiManager;
  ThemeData _theme;

  ThemeData get theme => _theme;

  @override
  @mustCallSuper
  Widget build(BuildContext context, VM model) {
    _uiManager = MovieLandingUIManager.of(context);
    return buildContent(context, model);
  }

  Widget buildContent(BuildContext context, VM model);
}

SnackBar showMovieSnackBar(String message,
    {String actionTitle: "", Function() onPressed}) {
}

showMovieToastMessage(
  String message, {
   Color backgroundColor,
   Color textColor,
  ToastGravity gravity: ToastGravity.BOTTOM,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: gravity,
    timeInSecForIosWeb: 3,
    backgroundColor: backgroundColor != null
        ? backgroundColor
        : AppColors.black.withOpacity(0.5),
    textColor: textColor != null ? textColor : AppColors.white,
    fontSize: 14,
  );
}
