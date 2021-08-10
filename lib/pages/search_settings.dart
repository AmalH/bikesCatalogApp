import 'package:bikestore/models/bikes_list.dart';
import 'package:bikestore/cubit/bikes_list_cubit.dart';
import 'package:bikestore/models/bikes_search_settings.dart';
import 'package:bikestore/utils/sort_criterias.dart';
import 'package:bikestore/widgets/bold_menu_text_widget.dart';
import 'package:bikestore/widgets/bold_menu_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchSettingsPage extends StatefulWidget {
  SearchSettingsPage({Key? key}) : super(key: key);
  @override
  _SearchSettingsPageState createState() => _SearchSettingsPageState();
}

class _SearchSettingsPageState extends State<SearchSettingsPage> {
  bool _sortDesc = true;
  late final BikesSearchSettings _searchSettings;
  late final BikesSearchSettings _allSearchSettings;
  @override
  void initState() {
    _searchSettings = BlocProvider.of<BikesListCubit>(context).searchSettings ??
        BikesSearchSettings([], []);
    _allSearchSettings =
        BlocProvider.of<BikesListCubit>(context).getAllSearchSettings();
    _sortDesc = _searchSettings.sort == SortOrder.DESC;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<BikesListCubit>(context),
        builder: (BuildContext context, BikesList BikesList) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Search Bikes"),
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: ListView(children: [
                BoldMenuTitle(text: "Sort"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Checkbox(
                        value: _searchSettings.sort != SortOrder.NONE,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              _searchSettings.sort =
                                  _sortDesc ? SortOrder.DESC : SortOrder.ASC;
                            } else {
                              _searchSettings.sort = SortOrder.NONE;
                            }
                          });
                        }),
                    BoldMenuText(text: "Sort bikes by"),
                    DropdownButton<SortCriteria>(
                        value: _searchSettings.sortBy,
                        onChanged: (value) {
                          if (value != null)
                            setState(() {
                              _searchSettings.sortBy = value;
                            });
                        },
                        items: [
                          DropdownMenuItem(
                              child: Text("Price"), value: SortCriteria.Price),
                          DropdownMenuItem(
                              child: Text("Frame"),
                              value: SortCriteria.FrameSize)
                        ]),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _sortDesc = !_sortDesc;
                          _searchSettings.sort =
                              _sortDesc ? SortOrder.DESC : SortOrder.ASC;
                        });
                      },
                      icon: RotatedBox(
                        child: Icon(Icons.sort),
                        quarterTurns: _sortDesc ? 0 : 2,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                BoldMenuTitle(text: "Filter"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpansionTile(
                        title: BoldMenuText(
                          text: "Brand",
                        ),
                        initiallyExpanded: true,
                        children: _allSearchSettings.brands
                            .map(
                              (brand) => CheckboxListTile(
                                  title: Text("$brand"),
                                  value: _searchSettings.brands.contains(brand),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value == true) {
                                        _searchSettings.brands.add(brand);
                                      } else {
                                        _searchSettings.brands.remove(brand);
                                      }
                                    });
                                  }),
                            )
                            .toList(),
                      ),
                      ExpansionTile(
                        title: BoldMenuText(
                          text: "Frame size",
                        ),
                        initiallyExpanded: true,
                        children: _allSearchSettings.frameSizes
                            .map(
                              (frame) => CheckboxListTile(
                                  title: Text("$frame"),
                                  value: _searchSettings.frameSizes
                                      .contains(frame),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value == true) {
                                        _searchSettings.frameSizes.add(frame);
                                      } else {
                                        _searchSettings.frameSizes
                                            .remove(frame);
                                      }
                                    });
                                  }),
                            )
                            .toList(),
                      ),
                      ExpansionTile(
                          title: BoldMenuText(
                            text: "Price range",
                          ),
                          initiallyExpanded: true,
                          children: [
                            RangeSlider(
                                min: _allSearchSettings.priceMin!,
                                max: _allSearchSettings.priceMax!,
                                divisions: 100,
                                labels: RangeLabels(
                                    "${_searchSettings.priceMin?.round()}",
                                    "${_searchSettings.priceMax?.round()}"),
                                values: RangeValues(
                                    _searchSettings.priceMin ??
                                        _allSearchSettings.priceMin!,
                                    _searchSettings.priceMax ??
                                        _allSearchSettings.priceMax!),
                                onChanged: (newRange) {
                                  setState(() {
                                    _searchSettings.priceMin = newRange.start;
                                    _searchSettings.priceMax = newRange.end;
                                  });
                                })
                          ])
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<BikesListCubit>()
                          .applySearchSettings(_searchSettings);
                      Navigator.of(context).pop();
                    },
                    child: Text("Valid"),
                  ),
                  width: double.infinity,
                )
              ]),
            ),
          );
        });
  }
}
