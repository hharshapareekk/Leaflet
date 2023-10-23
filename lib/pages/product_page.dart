import 'package:flutter/material.dart';
import 'package:books/db.dart';
import 'package:books/styles.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
        Module(
          child: Column(
            children: [
              Row(
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
              Row(
                children: [
                  Text("₹ ${book.sellers[0].cost.toInt()} onwards",
                      style: Styles.title),
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
            ],
          ),
        ),
        const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Description", style: Styles.title)),
        Module(child: Text(book.desc)),
        const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Sellers", style: Styles.title)),
        SellerView(sellers: book.sellers),
      ])
    ]));
  }
}

class SellerView extends StatefulWidget {
  SellerView({
    super.key,
    required this.sellers,
  });

  final List<Seller> sellers;
  int index = 0;

  @override
  State<SellerView> createState() => _SellerViewState();
}

class _SellerViewState extends State<SellerView> {
  @override
  Widget build(BuildContext context) {
    List<Seller> sellers = widget.sellers;
    int index = widget.index;
    return Module(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          SizedBox(
            height: 150,
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: sellers[index]
                    .images
                    .map((uri) => Image(image: AssetImage(uri)))
                    .toList()),
          ),
          GestureDetector(
              child: GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 50),
                children: [
                  ListTile(
                      leading: const Icon(Icons.verified_user),
                      title: Text(sellers[index].name)),
                  ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: Text("${sellers[index].rating}")),
                  ListTile(
                      leading: const Icon(Icons.star),
                      title: Text("${sellers[index].rating}")),
                  ListTile(
                      leading: const Icon(Icons.location_pin),
                      title: Text("${sellers[index].rating}")),
                ],
              ),
              onHorizontalDragUpdate: (details) {
                if (details.delta.direction < 0 && widget.index < 2) {
                  print("${details.delta.direction} ${widget.index}");
                  if (widget.index < 2) {
                    setState(() {
                      widget.index++;
                    });
                  }
                } else if (details.delta.direction < 0) {
                  print("${details.delta.direction} ${widget.index}");
                  if (widget.index > 0) {
                    setState(() {
                      widget.index--;
                    });
                  }
                }
              }),
        ]));
  }
}

class Module extends StatelessWidget {
  const Module({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      )),
    );
  }
}
