import 'package:books/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:books/db.dart';
import 'package:books/styles.dart';

class SearchPage extends StatefulWidget {
  String query = "";
  static const routeName = '/searchPage';
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        title: Hero(
          tag: "search",
          child: SearchBar(
              onChanged: (query) {}, trailing: const [Icon(Icons.search)]),
        ),
      ),
      SliverList.list(children: [
        GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 290),
            children: [
              ...DB.books.keys.map((key) {
                print(key);
                return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProductPage.routeName,
                          arguments: DB.books[key]!);
                    },
                    child: BookView(book: DB.books[key]!, colors: colors));
              })
            ])
      ])
    ]));
  }
}

class BookView extends StatelessWidget {
  const BookView({
    super.key,
    required this.book,
    required this.colors,
  });

  final Book book;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    final Seller seller = book.sellers[0];
    return Module(
      child: Column(children: [
        Hero(
          tag: book.title,
          transitionOnUserGestures: true,
          child: RoundedWidget(
            child: Image(
              height: 200,
              image: AssetImage(book.cover),
            ),
          ),
        ),
        Row(
          children: [
            Text("₹ ${seller.cost}", style: Styles.title),
            const Spacer(flex: 1),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined),
                color: colors.primary),
          ],
        ),
      ]),
    );
  }
}
