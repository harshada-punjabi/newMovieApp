import 'package:flutter/material.dart';

import 'app_state_container.dart';


class BottomLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100.0,
      child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
          ),

      ),
    );
  }
}
