import 'package:duckladydinh/api/app_data.dart';
import 'package:duckladydinh/widgets/appbar_title.dart';
import 'package:duckladydinh/widgets/event_board.dart';
import 'package:duckladydinh/widgets/idiom_board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    final appDataProvider = Provider.of<AppData>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          author: appDataProvider.getAuthor(),
          authorDayTitle: appDataProvider.getAuthorDayTitle(),
          authorNightTitle: appDataProvider.getAuthorNightTitle(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () async {
              await launch(appDataProvider.getResumeLocation());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            IdiomBoard(
              idioms: appDataProvider.getIdioms(),
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height * 0.85,
            ),
            EventBoard(
              events: List.from(appDataProvider.getEvents().reversed),
              maxWidth: MediaQuery.of(context).size.width,
              minWidth: 400,
              estimatedHeight: 250,
            ),
          ],
        ),
      ),
    );
  }
}
