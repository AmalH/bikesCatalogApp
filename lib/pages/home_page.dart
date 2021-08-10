import 'package:bikestore/models/bikes_list.dart';
import 'package:bikestore/cubit/bikes_list_cubit.dart';
import 'package:bikestore/models/bike.dart';
import 'package:bikestore/pages/details_page.dart';
import 'package:bikestore/pages/search_settings.dart';
import 'package:bikestore/widgets/bike_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  void _showDetails(Bike bike, BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailsPage(bike: bike)));
  }

  void _refresh(BuildContext context) {
    context.read<BikesListCubit>().refresh();
  }

  Widget _listBuilder(BikesList, BuildContext context) {
    return ListView.builder(
      itemCount: BikesList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: BikeItem(bike: BikesList[index]),
          onTap: () {
            _showDetails(BikesList[index], context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _refresh(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Our Bikes"),
        actions: [
          IconButton(
              onPressed: () {
                _refresh(context);
              },
              icon: Icon(Icons.refresh)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<SearchSettingsPage>(
                    builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<BikesListCubit>(context),
                        child: SearchSettingsPage()),
                  ),
                );
              },
              icon: Icon(Icons.settings)),
        ],
      ),
      body: Center(child:
          BlocBuilder<BikesListCubit, BikesList>(builder: (context, BikesList) {
        if (BikesList.isError == true) {
          return Text("An Error Occured !");
        } else if (BikesList.isLoading == true) {
          return CircularProgressIndicator();
        } else {
          if (BikesList.list!.isEmpty) {
            return Text("No bikes at this criteria");
          } else {
            return _listBuilder(BikesList.list!, context);
          }
        }
      })),
    );
  }
}
