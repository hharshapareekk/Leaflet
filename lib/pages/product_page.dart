import 'package:flutter/material.dart';
import 'package:books/db.dart';

class ProductPage extends StatelessWidget {
  final Book book;
  const ProductPage({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
        body: CustomScrollView(slivers: [
      const SliverAppBar(
        title: SearchBar(trailing: [Icon(Icons.search)]),
      ),
      SliverList.list(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(height: 200, image: AssetImage(book.cover)),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                        title: Text(book.title),
                        leading: const Icon(Icons.local_library)),
                    ListTile(
                        title: Text(book.author),
                        leading: const Icon(Icons.face)),
                    ListTile(
                        title: Text(
                            "${book.addedOn.day}/${book.addedOn.month}/${book.addedOn.year}"),
                        leading: const Icon(Icons.calendar_today)),
                    ListTile(
                        title: Text("${book.rating}"),
                        leading: const Icon(Icons.star)),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text("${book.sellers[0].cost}"),
              const Spacer(flex: 1),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined),
                  color: colors.primary),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_bag_outlined),
                  color: colors.primary),
            ],
          ),
        ),
        const Padding(
            padding: EdgeInsets.all(20.0), child: Text("Description")),
        Padding(padding: const EdgeInsets.all(20.0), child: Text(book.desc)),
        const Padding(padding: EdgeInsets.all(20.0), child: Text("Sellers")),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(book.sellers[0].name),
                GridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: 200,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    children: book.sellers[0].images
                        .map((uri) => Image(image: AssetImage(uri)))
                        .toList()),
              ])),
        ),
      ])
    ]));
  }
}
