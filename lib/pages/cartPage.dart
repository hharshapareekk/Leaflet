import 'package:books/pages/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:books/db.dart';
import 'package:books/styles.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static const routeName = '/cartPage';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
        bottomNavigationBar: Container(
        color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(children: [Spacer(flex: 1),  ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.shopping_bag), label: Text("Proceed", style: TextStyle(fontSize: 18)))]),
          ),
        ),
        body: CustomScrollView(slivers: [
      SliverAppBar(
        title: Hero(
            tag: "search",
            child: AppBar(
              leading: Icon(Icons.shopping_cart),
              title: Text(
                "Cart",
                style: Styles.title,
              ),
            )),
      ),
      SliverList.list(children: [
        ...DB.carts.map((cart) {
          return CartView(
              cartItem: cart, colors: colors, quantity: cart.quantity);
        })
      ])
    ]));
  }
}

class CartView extends StatefulWidget {
  CartView({
    super.key,
    required this.cartItem,
    required this.colors,
    required this.quantity,
  });

  int quantity;

  final CartItem cartItem;
  final ColorScheme colors;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Module(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RoundedWidget(
                  child: Image(
                      height: 200,
                      image: AssetImage(widget.cartItem.book.cover))),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                        title: Text(widget.cartItem.book.title),
                        leading: const Icon(Icons.local_library)),
                    ListTile(
                        title: Text("${widget.cartItem.book.author}"),
                        leading: const Icon(Icons.face)),
                    ListTile(
                      leading: SizedBox(
                        width: 200,
                        child: Row(children: [
                          IconButton(
                              onPressed: () {
                                if (widget.quantity >= 2) {
                                  setState(() {
                                    widget.quantity = widget.quantity - 1;
                                  });
                                }
                              },
                              icon: Icon(Icons.remove)),
                          Text("   ${widget.quantity}   ",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.quantity = widget.quantity + 1;
                                });
                              },
                              icon: Icon(Icons.add))
                        ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Text(
                  "₹ ${widget.cartItem.seller.cost * widget.quantity}",
                  style: Styles.title),
              const Spacer(flex: 1),
              // IconButton(
              //     onPressed: () {},
              //     icon: const Icon(Icons.shopping_cart_outlined),
              //     color: colors.primary),
              // IconButton(
              //     onPressed: () {},
              //     icon: const Icon(Icons.shopping_bag_outlined),
              //     color: colors.primary),
            ],
          ),
        ],
      ),
    );
  }
}
