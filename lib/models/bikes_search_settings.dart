import 'package:bikestore/utils/sort_criterias.dart';

class BikesSearchSettings {
  List<String> brands;
  List<double> frameSizes;
  double? priceMin;
  double? priceMax;
  SortOrder sort;
  SortCriteria? sortBy;

  BikesSearchSettings(this.brands, this.frameSizes,
      [this.priceMin,
      this.priceMax,
      this.sort = SortOrder.NONE,
      this.sortBy = SortCriteria.Price]);
}
