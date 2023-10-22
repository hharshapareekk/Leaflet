import 'package:sqflite/sqflite.dart';

class Book {
  final String title;
  final String isbn;

  const Book({
    required this.title,
    required this.isbn,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isbn': isbn,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Dog{title: $title, isbn: $isbn}';
  }
}

class DB {
  Future<Database> database;

  DB({required this.database});

  // Define a function that inserts dogs into the database
  Future<void> insertBook(Book book) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'books',
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
