import 'package:books/pages/searchPage.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:books/pages/homePage.dart';
import 'package:books/pages/product_page.dart';
import 'package:books/pages/sellerPage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:books/db.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  bool dark = true;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      final darkTheme = ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.lato().fontFamily,
        colorScheme: darkColorScheme ??
                    ColorScheme.fromSeed(
                        brightness: Brightness.dark, seedColor: Colors.blue));
      final lightTheme = ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.lato().fontFamily,
        colorScheme: lightColorScheme ??
                    ColorScheme.fromSeed(
                        brightness: Brightness.light, seedColor: Colors.blue));

      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Books',
          routes: {
            HomePage.routeName: (context) => const HomePage(),
            ProductPage.routeName: (context) =>
                const ProductPage(),
            SearchPage.routeName: (context) => SearchPage(),
            SellerPage.routeName: (context) =>
                SellerPage(),
          },
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          home: const HomePage());
    });
  }
}
