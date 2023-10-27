class DT {
  final int year;
  final int month;
  final int day;

  const DT({
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  String toString() {
    return '$day/$month/$year';
  }
}

class Seller {
  final String name;
  final String loc;
  final double rating;
  final List<String> images;
  final int cost;
  final DT addedOn;

  Seller({ required this.addedOn, required this.name, required this.rating, required this.images, required this.cost, required this.loc});
}

class Book {
  final String title;
  final String author;
  final String isbn;
  final String cover;
  final double rating;
  final List<Seller> sellers;
  final String desc;

  Book({
    required this.author,
    required this.title,
    required this.isbn,
    required this.cover,
    required this.rating,
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
      'sellers': sellers,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Book{title: $title, isbn: $isbn, cover: $cover, rating: $rating}';
  }
}

class DB {

    static List<Seller> sellers = [
        Seller(name: "Aryan", rating: 5.0, images: ["assets/book1.jpg", "assets/book2.jpg", "assets/book3.jpg"], cost: 100, loc: "Pune", addedOn: const DT(year: 2023, month: 8, day: 24)),
        Seller(name: "Lochlani", rating: 3.7, images: ["assets/book2.jpg"], cost: 150, loc: "Mumbai", addedOn: const DT(day: 10, month:8, year: 1942)),
        Seller(name: "Harsha", rating: 0.0, images: ["assets/book3.jpg"], cost: 10000, loc: "Kohlapur", addedOn: const DT(day:15, month: 10, year: 1905)),
    ];
  static Map<String, Book> books = {
    "HP1": Book(
            desc: """Turning the envelope over, his hand trembling, Harry saw a purple wax seal bearing a coat of arms; a lion, an eagle, a badger and a snake surrounding a large letter 'H'.

Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!


Having become classics of our time, the Harry Potter eBooks never fail to bring comfort and escapism. With their message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers.""",
      title: "Harry Potter And The Philosoper's Stone",
      author: "J.K. Rowling",
      isbn: "",
      cover: "assets/HP1.jpg",
      rating: 5,
      sellers: sellers
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
      sellers: sellers    ),
    "HP7": Book(
            desc: """Turning the envelope over, his hand trembling, Harry saw a purple wax seal bearing a coat of arms; a lion, an eagle, a badger and a snake surrounding a large letter 'H'.

Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!


Having become classics of our time, the Harry Potter eBooks never fail to bring comfort and escapism. With their message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers.""",
      title: "Harry Potter And The Deathly Hallows",
      author: "J.K. Rowling",
      isbn: "",
      cover: "assets/HP7.jpg",
      rating: 5,
      sellers: sellers
    ),
  };
}
