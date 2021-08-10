import 'package:bikestore/cubit/bikes_list_cubit.dart';
import 'package:bikestore/models/bikes_list.dart';
import 'package:bikestore/models/bikes_search_settings.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BikesListCubit', () {
    setUp(() => {TestWidgetsFlutterBinding.ensureInitialized()});

    late BikesListCubit BikesListBloc;

    setUp(() {
      BikesListBloc = BikesListCubit(BikesList.empty());
    });

    blocTest<BikesListCubit, BikesList>(
      'emits [1] when applying search settings',
      build: () => BikesListBloc,
      act: (cubit) => cubit.applySearchSettings(BikesSearchSettings([], [])),
      expect: () => <BikesListCubit>[],
    );
  });
}
