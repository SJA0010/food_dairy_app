import 'package:flutter/services.dart';
import 'package:food_dairy_app/controller/sqllite.dart';
import 'package:food_dairy_app/screen/loginScreen.dart';
import 'package:food_dairy_app/widget/theme/app_theme.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainTheme.scaffoldBackgroundColor,
      statusBarBrightness: Brightness.light));
  runApp(const MyApp());
  await DBHelper.initDatabase();
  await DBHelper.deleteOldDatabase();
  await DBHelper.initDatabase();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Dairy App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: mainTheme.scaffoldBackgroundColor),
        useMaterial3: true,
      ),

      home: const LoginScreen(),
      // HomeScreen(),
      darkTheme: mainTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
