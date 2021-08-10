import 'package:bikestore/models/bike.dart';
import 'package:bikestore/models/bikes_search_settings.dart';
import 'package:bikestore/services/bikes_service.dart';
import 'package:bikestore/utils/sort_criterias.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';
import '../models/bikes_list.dart';

class BikesListCubit extends Cubit<BikesList> {
  late List<Bike> _initialList;
  BikesSearchSettings? searchSettings;

  BikesListCubit(BikesList initialState) : super(initialState);

  void applySearchSettings(BikesSearchSettings searchSettings) async {
    this.searchSettings = searchSettings;
    var _newlist = _initialList;
    _newlist = _initialList
        .where((element) =>
            searchSettings.brands.contains(element.brand) &&
            searchSettings.frameSizes.contains(element.frameSize) &&
            element.price >= (searchSettings.priceMin ?? 0.0) &&
            element.price <= (searchSettings.priceMax ?? double.infinity))
        .toList();
    if (searchSettings.sort != SortOrder.NONE) {
      if (searchSettings.sortBy == SortCriteria.Price) {
        _newlist.sort((e1, e2) => searchSettings.sort == SortOrder.ASC
            ? e1.price.compareTo(e2.price)
            : e2.price.compareTo(e1.price));
      } else if (searchSettings.sortBy == SortCriteria.FrameSize) {
        _newlist.sort((e1, e2) => searchSettings.sort == SortOrder.ASC
            ? e1.frameSize.compareTo(e2.frameSize)
            : e2.frameSize.compareTo(e1.frameSize));
      }
    }
    emit(BikesList(false, false, _newlist));
  }

  void refresh() async {
    emit(BikesList(true, false));
    BikesService.getBikes().then((value) {
      if (value != null) {
        _initialList = value;
        searchSettings = getAllSearchSettings();
        emit(BikesList(false, false, value));
      } else {
        emit(BikesList(false, true));
      }
    }).onError((error, stackTrace) {
      emit(BikesList(false, true));
    });
  }

  BikesSearchSettings getAllSearchSettings() {
    List<String> brands = _initialList.map((e) => e.brand).toSet().toList();
    List<double> frames = _initialList.map((e) => e.frameSize).toSet().toList();
    double priceMin = _initialList.map((e) => e.price).toList().reduce(min);
    double priceMax = _initialList.map((e) => e.price).toList().reduce(max);
    return BikesSearchSettings(brands, frames, priceMin, priceMax);
  }
}
