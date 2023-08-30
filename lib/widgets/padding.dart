import 'package:flutter/material.dart';

class PaddingStyle1 extends StatelessWidget {
  final Widget child;

  const PaddingStyle1({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(21), child: child);
  }
}

class PaddingStyle2 extends StatelessWidget {
  final Widget child;

  const PaddingStyle2({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 5), child: child);
  }
}
