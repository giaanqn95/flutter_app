import 'package:flutter/material.dart';
import "package:flutter_app/ExtensionProperty/ActivityNavigation.dart";

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            popPage(context);
          },
        ),
      ),
    );
  }
}