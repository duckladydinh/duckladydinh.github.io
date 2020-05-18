import 'package:duckladydinh/api/app_data.dart';
import 'package:duckladydinh/main.dart';
import 'package:duckladydinh/widgets/event_board.dart';
import 'package:duckladydinh/widgets/idiom_board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLightMode = false;

  @override
  Widget build(BuildContext context) {
    final themeModeProvider = Provider.of<ThemeModeProvider>(context);
    final appDataProvider = Provider.of<AppData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              appDataProvider.getAuthor(),
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .apply(color: Colors.white),
            ),
            Switch(
              value: isLightMode,
              onChanged: (value) {
                setState(() {
                  isLightMode = value;
                });
                themeModeProvider
                    .setTheme(isLightMode ? ThemeMode.light : ThemeMode.dark);
              },
            ),
            Text(
              isLightMode
                  ? appDataProvider.getAuthorDayTitle()
                  : appDataProvider.getAuthorNightTitle(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .apply(color: Colors.white),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () async {
              await launch("/assets/static/Lam_Gia_Thuan_CV_3_0.pdf");
            },
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Column(
            children: [
              IdiomBoard(
                idioms: appDataProvider.getIdioms(),
                maxWidth: constraints.maxWidth,
                maxHeight: constraints.maxHeight,
              ),
              EventBoard(
                events: List.from(appDataProvider.getEvents().reversed),
                maxWidth: constraints.maxWidth,
                minWidth: 400,
                estimatedHeight: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
