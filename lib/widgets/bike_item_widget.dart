import 'package:bikestore/models/bike.dart';
import 'package:bikestore/utils/bike_category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'bike_item_row_widget.dart';
import 'bold_menu_title_widget.dart';

class BikeItem extends StatelessWidget {
  const BikeItem({Key? key, required this.bike}) : super(key: key);
  final Bike bike;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Center(
              child: CachedNetworkImage(
                imageUrl: bike.pictures.first,
                placeholder: (context, url) => Icon(Icons.image),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            ),
            fit: FlexFit.tight,
            flex: 10,
          ),
          Flexible(
            child: Container(),
            flex: 1,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldMenuTitle(text: bike.name),
                SizedBox(
                  height: 10.0,
                ),
                BikeItemRow(
                  title: "Brand name:",
                  value: bike.brand,
                ),
                BikeItemRow(
                  title: "Category",
                  value: bike.category.toShortString(),
                ),
                BikeItemRow(
                  title: "Frame size",
                  value: bike.frameSize.toStringAsFixed(1) + "\"",
                ),
                BikeItemRow(
                  title: "Price",
                  value: bike.price.toStringAsFixed(2) + "€",
                ),
              ],
            ),
            fit: FlexFit.tight,
            flex: 20,
          ),
        ],
      ),
    );
  }
}
