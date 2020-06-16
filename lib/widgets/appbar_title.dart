import 'package:duckladydinh/api/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarTitle extends StatelessWidget {
  final String authorNightTitle;
  final String authorDayTitle;
  final String author;

  AppBarTitle({this.author, this.authorDayTitle, this.authorNightTitle});

  @override
  Widget build(BuildContext context) {
    final appDataProvider = Provider.of<DataProvider>(context);

    final themeModeProvider = Provider.of<ThemeModeProvider>(context);
    final lightMode = themeModeProvider.getTheme() == ThemeMode.light;

    return Row(
      children: [
        Text(
          author,
          style:
              Theme.of(context).textTheme.headline5.apply(color: Colors.white),
        ),
        Switch(
          value: lightMode,
          inactiveThumbImage: appDataProvider.getMoonIcon(),
          activeThumbImage: appDataProvider.getSunIcon(),
          onChanged: (_) {
            themeModeProvider
                .setTheme(lightMode ? ThemeMode.dark : ThemeMode.light);
          },
        ),
        Text(
          lightMode ? authorDayTitle : authorNightTitle,
          style:
              Theme.of(context).textTheme.subtitle1.apply(color: Colors.white),
        ),
      ],
    );
  }
}
