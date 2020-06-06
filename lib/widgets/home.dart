import 'package:duckladydinh/api/providers.dart';
import 'package:duckladydinh/widgets/appbar_title.dart';
import 'package:duckladydinh/widgets/event_board.dart';
import 'package:duckladydinh/widgets/idiom_board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    final appDataProvider = Provider.of<DataProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final events = appDataProvider.getEvents();
    final idioms = appDataProvider.getIdioms();

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          author: appDataProvider.getAuthor(),
          authorDayTitle: appDataProvider.getAuthorDayTitle(),
          authorNightTitle: appDataProvider.getAuthorNightTitle(),
        ),
        actions: [
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
              idioms: idioms,
              maxWidth: screenWidth,
              maxHeight: screenHeight * 0.8,
            ),
            EventBoard(
              events: events,
              boardWidth: screenWidth,
            ),
          ],
        ),
      ),
    );
  }
}
