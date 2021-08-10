import 'package:bikestore/utils/bike_category.dart';

class Bike {
  int id;
  String name;
  BikeCategory category;
  double frameSize;
  double price;
  List<String> pictures;
  String brand;
  String description;

  Bike(this.id, this.name, this.category, this.frameSize, this.price,
      this.pictures, this.brand, this.description);

  factory Bike.fromJson(Map<String, dynamic> json) {
    return new Bike(
        json['id'],
        json['name'],
        fromString(json['category']) ?? BikeCategory.None,
        json['wheel_size'].toDouble(),
        json['price'].toDouble(),
        (json['pictures'] as List<dynamic>).cast<String>(),
        json['brand'],
        json['details']);
  }
}
