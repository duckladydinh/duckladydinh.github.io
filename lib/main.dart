import 'package:duckladydinh/api/providers.dart';
import 'package:duckladydinh/data/manual_app_data.dart';
import 'package:duckladydinh/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const DARK_COLOR = Color.fromARGB(255, 32, 33, 36);

void main() {
  final now = DateTime.now();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeModeProvider((now.hour >= 6 && now.hour < 18)
            ? ThemeMode.light
            : ThemeMode.dark),
      ),
      Provider(
        create: (context) {
          DataProvider dataProvider = ManualDataProvider();
          return dataProvider;
        },
      ),
    ],
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeModeProvider = Provider.of<ThemeModeProvider>(context);
    return MaterialApp(
      title: 'Thuan\'s Home',
      theme: ThemeData.light(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: DARK_COLOR,
        canvasColor: DARK_COLOR,
        cardColor: DARK_COLOR,
      ),
      themeMode: themeModeProvider.getTheme(),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
