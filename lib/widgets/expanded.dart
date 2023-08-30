import 'package:flutter/material.dart';
import 'package:weather_app/widgets/textStyle.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget(
      {Key? key, required this.titleText, required this.subTitleText})
      : super(key: key);
  final String titleText;
  final String subTitleText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        title: Text(
          titleText.toString(),
          style: textStyle1(),
        ),
        subtitle: Text(
          subTitleText.toString(),
          style: textStyle1(),
        ),
      ),
    );
  }
}
