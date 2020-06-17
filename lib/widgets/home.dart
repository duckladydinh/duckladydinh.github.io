import 'dart:math';
import 'dart:ui';

import 'package:duckladydinh/api/providers.dart';
import 'package:duckladydinh/widgets/appbar_title.dart';
import 'package:duckladydinh/widgets/event_board.dart';
import 'package:duckladydinh/widgets/idiom_board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    final themeModeProvider = Provider.of<ThemeModeProvider>(context);
    final appDataProvider = Provider.of<DataProvider>(context);
    final wallpaper = (themeModeProvider.getTheme() == ThemeMode.light)
        ? appDataProvider.getDayWallpaper()
        : appDataProvider.getNightWallpaper();
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
            tooltip: "Resume",
            onPressed: () async {
              await launch(appDataProvider.getResumeLocation());
            },
          ),
          PopupMenuButton(
              icon: Icon(Icons.web),
              tooltip: "External",
              onSelected: (link) async {
                await launch(link);
              },
              offset: Offset.fromDirection(pi / 2, 64.0),
              itemBuilder: (_) => appDataProvider
                  .getExternalPageReferences()
                  .map((page) => PopupMenuItem(
                        value: page.link,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              width: 32.0,
                              image: page.icon,
                            ),
                            const VerticalDivider(
                              thickness: 1.0,
                            ),
                            Text(page.name)
                          ],
                        ),
                      ))
                  .toList()),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: wallpaper,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: IdiomBoard(
                  idioms: idioms,
                  maxWidth: screenWidth,
                  maxHeight: screenHeight * 0.8,
                ),
              ),
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
