import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.message, {Key? key}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
