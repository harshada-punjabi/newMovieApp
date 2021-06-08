import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'app_state_container.dart';
import 'empty_widget.dart';

class AppLauncher extends StatefulWidget {
  final String url;
  final String? trailerName;
  AppLauncher({required this.url, this.trailerName}) : assert(url != null);

  @override
  _AppLauncherState createState() => _AppLauncherState();
}

class _AppLauncherState extends State<AppLauncher> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final _key = UniqueKey();
  late bool _isLoadingPage;

  @override
  void initState() {
    super.initState();
    _isLoadingPage = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('${widget.trailerName}',
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          softWrap: true,
          maxLines: 1,
          style: TextStyle(
            color: AppStateContainer.of(context).theme.accentColor,
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            key: _key,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
              webViewController.loadUrl(widget.url);
            },
            onPageFinished: (finish) {
              setState(() {
                _isLoadingPage = false;
              });
            },
          ),
          _isLoadingPage
              ? Container(
                  alignment: FractionalOffset.center,
                  child: Theme(
                    data: Theme.of(context).copyWith(accentColor: Colors.black),
                    child: new CircularProgressIndicator(),
                  ),
                )
              : EmptyWidget(),
        ],
      ),
    );
  }
}
