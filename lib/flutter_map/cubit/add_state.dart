// part of 'add_cubit.dart';

class AddlocState {
  final List<Data> items;

  AddlocState({required this.items});
}

class Data {
  final String num;
  final String lat;
  final String lan;
  final String type;

  Data({
    required this.num,
    required this.lat,
    required this.lan,
    required this.type,
  });
}
