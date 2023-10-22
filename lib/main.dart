import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

// import 'package:googleapis/books/v1.dart';
import 'package:provider/provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
import 'package:books/db.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  // final database = openDatabase(
  //   join(await getDatabasesPath(), 'doggie_database.db'),
  // );
  // final dbpath = await getDatabasesPath();

  // print(dbpath);
  // final db = DB(
  //     database: openDatabase(
  //   join(dbpath, 'books.db'),
  //   onCreate: (db, version) {
  //     // Run the CREATE TABLE statement on the database.
  //     return db.execute(
  //       'CREATE TABLE books(title TEXT, isbn TEXT)',
  //     );
  //   },
  //   version: 1,
  // ));

  const book = Book(title: 'hello', isbn: '8989989');
  const recentBooks = [
    // Book(isbn: '')
  ];

  // db.insertBook(book);

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
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Books',
        routes: {
          '/HomePage': (context) =>
              const HomePage(title: 'Books (ik creative :) )'),
        },
        theme: theme,
        home: const HomePage(title: 'Books (ik creative :) )'),
      );
    });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
