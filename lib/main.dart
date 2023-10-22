import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:books/pages/homePage.dart';
import 'package:books/pages/product_page.dart';

import 'package:provider/provider.dart';
import 'package:books/db.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      final theme = ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme ??
            ColorScheme.fromSeed(
                brightness: Brightness.dark, seedColor: Colors.blue),
      );

      theme.copyWith(colorScheme: theme.colorScheme.copyWith(background: theme.primaryColor.harmonizeWith(theme.colorScheme.background)));
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Books',
        routes: {
          '/HomePage': (context) =>
              const HomePage(title: 'Books (ik creative :) )'),
          '/ProductPage': (context) =>
              ProductPage(book: DB.books["HP1"] as Book),
        },
        theme: theme,
        home: ProductPage(book: DB.books["HP1"] as Book),
      );
    });
  }
}
