import 'package:flutter/material.dart';
import 'package:books/db.dart';
import 'package:books/styles.dart';

class SellerPage extends StatefulWidget {
  SellerPage({super.key, required this.seller, required this.books});
  final Seller seller;
  List<Book> books;

  @override
  State<SellerPage> createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final book = DB.books["HP1"]!;
    return Scaffold(
        body: CustomScrollView(slivers: [
      // SliverAppBar(
      //   title: SearchBar(
      //       onChanged: (query) {}, trailing: const [Icon(Icons.search)]),
      // ),
      SliverList.list(
        children: [
        const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Profile", style: Styles.title)),
          Module(
              child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                  foregroundImage: Image.asset(book.cover).image, radius: 50),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                        title: Text(widget.seller.name),
                        leading: const Icon(Icons.face)),
                    ListTile(
                        title: Text(widget.seller.loc),
                        leading: const Icon(Icons.location_pin)),
                    ListTile(
                        title: Text("${widget.seller.rating}"),
                        leading: const Icon(Icons.star_rate)),
                  ],
                ),
              )
            ],
          )),
        const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Books", style: Styles.title)),

          ...widget.books.map((book) {
            return SellerBookView(book: book, colors: colors);
          }),
          Center(
              child: Module(
                  child: IconButton(
                      onPressed: () {
                        openDialog();
                      },
                      icon: const Icon(Icons.add)))),
        ],
      )
    ]));
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
              title: const Text("Enter ISBN Number:"),
              content: const TextField(
                  autofocus: true, decoration: InputDecoration()),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        widget.books.add(DB.books["HP4"]!);
                      });
                    },
                    icon: const Icon(Icons.done))
              ]));
}

class SellerBookView extends StatefulWidget {
  SellerBookView({
    super.key,
    required this.book,
    required this.colors,
  });

  bool expand = false;
  final Book book;
  final ColorScheme colors;

  @override
  State<SellerBookView> createState() => _SellerBookViewState();
}

class _SellerBookViewState extends State<SellerBookView> {
  @override
  Widget build(BuildContext context) {
    final Seller seller = widget.book.sellers[0];

    var people = widget.expand
        ? widget.book.sellers.map((s) {
            if (s.name != seller.name) {
              return ListTile(title: Text(s.name), subtitle: Text("${s.cost}"));
            } else {
              return const SizedBox();
            }
          })
        : [const SizedBox()];
    return Module(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RoundedWidget(
                  child:
                      Image(height: 200, image: AssetImage(widget.book.cover))),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                        title: Text(widget.book.title),
                        leading: const Icon(Icons.local_library)),
                    ListTile(
                        title: Text(widget.book.author),
                        leading: const Icon(Icons.face)),
                    ListTile(
                        title: Text("${widget.book.sellers[0].addedOn}"),
                        leading: const Icon(Icons.calendar_today)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          RoundedWidget(
            child: SizedBox(
              height: 150,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: seller.images
                      .map((uri) => Image(image: AssetImage(uri)))
                      .toList()),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child:
                Text("₹ ${widget.book.sellers[0].cost}", style: Styles.title),
          ),
          Column(
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.expand = !widget.expand;
                    });
                  },
                  child: const Text("(Also Sold By)")),
              ...people
            ],
          )
        ],
      ),
    );
  }
}
