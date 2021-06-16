import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';

import 'di/providers.dart';
import 'movie_landing_page_application.dart';


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
