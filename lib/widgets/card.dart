import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.child, required this.height})
      : super(key: key);
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18))),
      elevation: 20,
      color: Colors.white.withAlpha(90),
      child: Container(
        padding: const EdgeInsets.all(5),
        height: height,
        width: MediaQuery.of(context).size.width - 20,
        child: child,
      ),
    );
  }
}
