import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            navService.pushNamed('/detail_screen', args: 'From Home Screen');
          },
          child: Text('Go to Detail Screen'),
        ),
      ),
    );
  }
}
