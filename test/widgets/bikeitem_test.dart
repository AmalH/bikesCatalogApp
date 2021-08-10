import 'package:bikestore/models/bike.dart';
import 'package:bikestore/utils/bike_category.dart';
import 'package:bikestore/widgets/bike_item_widget.dart';
import 'package:bikestore/widgets/bike_item_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BikeItem', () {
    testWidgets('renders correct number of rows', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BikeItem(
              bike: Bike(
                  0,
                  "bike1",
                  BikeCategory.Dirt,
                  26.0,
                  100.0,
                  ["https://picsum.photos/300/200"],
                  "GOOGLE",
                  "A google bicycle"),
            ),
          ),
        ),
      );
      expect(find.byWidgetPredicate((widget) => widget is BikeItemRow),
          findsNWidgets(4));
    });

    testWidgets('renders correct category name', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BikeItem(
              bike: Bike(
                  0,
                  "bike1",
                  BikeCategory.Dirt,
                  26.0,
                  100.0,
                  ["https://picsum.photos/300/200"],
                  "GOOGLE",
                  "A google bicycle"),
            ),
          ),
        ),
      );
      expect(find.text("Dirt"), findsOneWidget);
    });
  });
}
