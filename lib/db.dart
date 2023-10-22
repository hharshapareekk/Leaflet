class DT {
  final int year;
  final int month;
  final int day;

  const DT({
    required this.year,
    required this.month,
    required this.day,
  });
}

class Seller {
  final String name;
  final double rating;
  final List<String> images;
  final double cost;

  Seller({required this.name, required this.rating, required this.images, required this.cost});
}

class Book {
  final String title;
  final String author;
  final String isbn;
  final String cover;
  final double rating;
  final DT addedOn;
  final List<Seller> sellers;
  final String desc;

  Book({
    required this.author,
    required this.title,
    required this.isbn,
    required this.cover,
    required this.rating,
    required this.addedOn,
    required this.sellers,
    required this.desc,
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
      'sellers': sellers,
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
  static final books = {
    "HP1": Book(
            desc: """Turning the envelope over, his hand trembling, Harry saw a purple wax seal bearing a coat of arms; a lion, an eagle, a badger and a snake surrounding a large letter 'H'.

Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!


Having become classics of our time, the Harry Potter eBooks never fail to bring comfort and escapism. With their message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers.""",
      title: "Harry Potter And The Philosoper's Stone",
      author: "J.K. Rowling",
      isbn: "",
      cover: "assets/HP1.jpg",
      rating: 5,
      addedOn: const DT(day: 20, month: 10, year: 1999),
      sellers: [
        Seller(name: "Aryan", rating: 5.0, images: ["assets/HP4.jpg", "assets/HP1.jpg", "assets/Clash.jpg"], cost: 100),
        Seller(name: "Lochlani", rating: 3.7, images: ["assets/HP4.jpg"], cost: 150),
        Seller(name: "Harsha", rating: 0.0, images: ["assets/HP4.jpg"], cost: 10000),
      ]
    ),
    "HP4": Book(
            desc: """Turning the envelope over, his hand trembling, Harry saw a purple wax seal bearing a coat of arms; a lion, an eagle, a badger and a snake surrounding a large letter 'H'.

Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!


Having become classics of our time, the Harry Potter eBooks never fail to bring comfort and escapism. With their message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers.""",
      title: "Harry Potter And The Goblet Of Fire",
      author: "J.K. Rowling",
      isbn: "",
      cover: "assets/HP4.jpg",
      rating: 5,
      addedOn: const DT(day: 20, month: 10, year: 1999),
      sellers: [
        Seller(name: "Aryan", rating: 5.0, images: ["assets/HP4.jpg", "assets/HP1.jpg", "assets/Clash.jpg"], cost: 100),
        Seller(name: "Lochlani", rating: 3.7, images: ["assets/HP4.jpg"], cost: 150),
        Seller(name: "Harsha", rating: 0.0, images: ["assets/HP4.jpg"], cost: 10000),
      ]
    ),
  };
}
