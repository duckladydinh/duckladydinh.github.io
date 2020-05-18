import 'package:duckladydinh/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarTitle extends StatefulWidget {
  final String authorNightTitle;
  final String authorDayTitle;
  final String author;

  AppBarTitle({this.author, this.authorDayTitle, this.authorNightTitle});

  @override
  _AppBarTitleState createState() {
    return _AppBarTitleState();
  }
}

class _AppBarTitleState extends State<AppBarTitle> {
  bool isLightMode = false;

  @override
  Widget build(BuildContext context) {
    final themeModeProvider = Provider.of<ThemeModeProvider>(context);

    return Row(
      children: [
        Text(
          widget.author,
          style:
              Theme.of(context).textTheme.headline5.apply(color: Colors.white),
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
          isLightMode ? widget.authorDayTitle : widget.authorNightTitle,
          style:
              Theme.of(context).textTheme.subtitle1.apply(color: Colors.white),
        ),
      ],
    );
  }
}
