import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_base_architecture/ui/base_widget.dart';
import 'package:provider/provider.dart';

import 'di/providers.dart';
import 'movie_landing_page_application.dart';
import 'movie_landing_page_application_viewmodel.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runZoned(() {
    runApp(
      MultiProvider(
        providers: providers,
        child: MainAppWidget(),),

    );
  });
}

class MainAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MovieLandingPageApplication();
  }
}
