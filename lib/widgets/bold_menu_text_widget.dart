import 'package:flutter/material.dart';

class BoldMenuText extends StatelessWidget {
  const BoldMenuText({Key? key, required this.text}) : super(key: key);
  final String text;
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle2,
    );
  }
}
