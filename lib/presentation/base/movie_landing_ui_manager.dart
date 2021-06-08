import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base_architecture/utils/ui_manager.dart';

class MovieLandingUIManager extends UIManager {
  MovieLandingUIManager._(context) : super(context);

  static MovieLandingUIManager of(BuildContext context) {
    assert(context != null);
    return MovieLandingUIManager._(context);
  }

  @override
  double size(BuildContext context, double size) {
    return size * widthScale;
  }

  @override
  Size referenceModel() {
    return Size(1920, 1080);
  }
}
