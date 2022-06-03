import 'package:flutter/material.dart';
import 'package:hamo_home_service/helper/theme_data_helper.dart';
import 'package:hamo_home_service/provider/dark_theme_provider.dart';
import 'package:hamo_home_service/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DarkThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(
      builder: (context, darkThemeProvider, child) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              title: 'Hamo - Home Service',
              debugShowCheckedModeBanner: false,
              theme: ThemeDataHelper.themeData(darkThemeProvider.darkTheme, context),
              home: const HomeScreen(),
            );
          }
        );
      }
    );
  }
}