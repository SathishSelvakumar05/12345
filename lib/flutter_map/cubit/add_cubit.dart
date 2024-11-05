import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'add_state.dart';

// part 'add_state.dart';

class AddCubit extends Cubit<AddlocState> {
  AddCubit()
      : super(AddlocState(items: [
          Data(
              num: 'TN 72 A 7345', lat: '12.9249', lan: '80.1000', type: 'CAR'),
          Data(
              num: 'TN 72 B 9812',
              lat: '12.9433',
              lan: '80.1191',
              type: 'Bike'),
        ]));

  void AddLoc(String num, String lat, String lan, String selectedVehicleType) {
    final newItem =
        Data(num: num, lat: lat, lan: lan, type: selectedVehicleType);
    print(num);
    final updatedItems = List<Data>.from(state.items)..add(newItem);
    emit(AddlocState(items: updatedItems));
  }
}
