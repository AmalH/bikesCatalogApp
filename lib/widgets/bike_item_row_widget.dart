import 'package:flutter/material.dart';

class BikeItemRow extends StatelessWidget {
  const BikeItemRow({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(value)
      ]),
    );
  }
}
