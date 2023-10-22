class dt {
    final int year;
    final int month;
    final int day;

    const dt({
        required this.year,
        required this.month,
        required this.day,
    });
}

class Book {
  final String title;
  final String isbn;
  final String cover;
  final double rating;
  final dt addedOn;

  const Book({
    required this.title,
    required this.isbn,
    required this.cover,
    required this.rating,
    required this.addedOn,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isbn': isbn,
      'cover': cover,
      'rating': rating,
      'addedOn': addedOn,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Book{title: $title, isbn: $isbn, cover: $cover, rating: $rating, addedOn: $addedOn}';
  }
}

class DB {
    static const books = {
        "HP1": 
            Book(title: "Harry Potter And The Philosoper's Stone", 
            isbn: "",
            cover: "../assets/HP1.jpg",
            rating: 5,
            addedOn: dt(day: 20, month: 10, year: 1999),
        ),
        "HP4": 
            Book(title: "Harry Potter And The Goblet Of Fire", 
            isbn: "",
            cover: "../assets/HP4.jpg",
            rating: 5,
            addedOn: dt(day: 20, month: 10, year: 1999),
        ),
    };
}
