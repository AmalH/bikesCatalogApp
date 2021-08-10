import 'package:bikestore/widgets/bike_item_row_widget.dart';
import 'package:bikestore/widgets/bold_menu_text_widget.dart';
import 'package:bikestore/widgets/bold_menu_title_widget.dart';
import 'package:bikestore/models/bike.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:bikestore/utils/bike_category.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.bike}) : super(key: key);
  final Bike bike;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bike.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            ImageSlideshow(
              width: double.infinity,
              initialPage: 0,
              indicatorColor: Theme.of(context).primaryColor,
              indicatorBackgroundColor: Colors.grey,
              children: bike.pictures
                  .map<Widget>((url) => CachedNetworkImage(
                        imageUrl: url,
                        placeholder: (context, url) => Icon(Icons.image),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.fitHeight,
                      ))
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                  SizedBox(
                    height: 15.0,
                  ),
                  BoldMenuText(text: "Description"),
                  Text(bike.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
