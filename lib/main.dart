import 'package:bikestore/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/bikes_list_cubit.dart';
import 'models/bikes_list.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bikes Catalog',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BlocProvider(
        create: (BuildContext context) => BikesListCubit(BikesList.empty()),
        child: HomePage(),
      ),
    );
  }
}
