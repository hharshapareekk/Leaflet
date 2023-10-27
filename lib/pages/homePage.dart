import 'package:books/pages/product_page.dart';
import 'package:books/pages/searchPage.dart';
import 'package:books/pages/sellerPage.dart';
import 'package:flutter/material.dart';
import 'package:books/db.dart';
import 'package:books/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/homePage';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final book = DB.books["HP1"]!;

    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        title: AppBar(
          title: const Text("Good morning", style: Styles.greeting),
          actions: [
            IconButton(onPressed: 
                () {
                    Navigator.pushNamed(context, SearchPage.routeName);
                }, icon: const Icon(Icons.search)),
            GestureDetector(
                onTap: () {
                    Navigator.pushNamed(context, SellerPage.routeName);
                },
              child: CircleAvatar(radius: 16,
              foregroundImage: Image.asset(book.cover).image),
            ),
          ],
        ),
      ),
      SliverList.list(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisSpacing: 0,
                mainAxisExtent: 70,
                crossAxisSpacing: 0),

            // crossAxisCount: 2,
            children: [
              ...DB.books.keys.map((key) {
                return GestureDetector(
                  child: Card(
                      child: ListTile(
                    onTap: (() {
                              Navigator.pushNamed(context, ProductPage.routeName, arguments: DB.books[key]!);
                    }),
                    minLeadingWidth: 20,
                    leading: SizedBox(
                        height: 100,
                        child: RoundedWidget(
                            child: Image(image: AssetImage(DB.books[key]!.cover)))),
                    title: Text(DB.books[key]!.title, style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.fade, maxLines: 2),
                  )),
                );
              })
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Recommended For You",
            style: Styles.title,
          ),
        ),
        const BookList(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Best Sellers",
            style: Styles.title,
          ),
        ),
        const BookList(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Based on your recent purchases",
            style: Styles.title,
          ),
        ),
        const BookList(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Because you read Fantasy",
            style: Styles.title,
          ),
        ),
        const BookList(),

        // BookView(book: book, colors: colors),
        // DescriptionBox(book: book),
        // SellerView(sellers: book.sellers, colors: colors),
      ])
    ]));
  }
}

class BookList extends StatelessWidget {
  const BookList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Module(
      child: SizedBox(
        height: 150,
        child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: DB.books.keys.map((key) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: RoundedWidget(
                    child: Image(image: AssetImage(DB.books[key]!.cover))),
              );
            }).toList()),
      ),
    );
  }
}

