import 'package:bikestore/models/bike.dart';

class BikesList {
  List<Bike>? list;
  bool? isLoading;
  bool? isError;

  BikesList(this.isLoading, this.isError, [this.list]);

  BikesList.empty() {
    list = <Bike>[];
    isError = false;
    isLoading = false;
  }
}
