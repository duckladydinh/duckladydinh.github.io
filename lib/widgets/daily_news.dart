import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily News"),
      ),
      body: Center(
        child: Text(
          "Coming soon...🐣",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
