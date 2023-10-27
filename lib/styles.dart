import 'package:flutter/material.dart';

class Styles {
    static const title=TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
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
