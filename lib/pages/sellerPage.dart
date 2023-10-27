import 'package:flutter/material.dart';
import 'package:books/db.dart';
import 'package:books/styles.dart';

class SellerPage extends StatelessWidget {
  SellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final book = DB.books["HP1"]!;
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        title: SearchBar(
            onChanged: (query) {}, trailing: const [Icon(Icons.search)]),
      ),
      SliverList.list(children: [
        GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 290),
            children: [
              BookView(book: book, colors: colors),
              BookView(book: DB.books["HP4"]!, colors: colors),
              BookView(book: DB.books["HP7"]!, colors: colors),
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
    return GridTile(
      header: Flexible(
        child: Row(
          children: [
            Text("₹ ${seller.cost}", style: Styles.title),
            const Spacer(flex: 1),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined),
                color: colors.primary),
          ],
        ),
      ),
      child: Image(
        height: 200,
        image: AssetImage(book.cover),
      ),
    );
  }
}

