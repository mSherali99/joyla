import 'package:joyla/data/source/local/floor_entity.dart';

class ListModel {
  final int id;
  final String description;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String image5;
  final String info;
  final String name;
  final String phone;
  final String price;
  final String userName;
  final String time;
  final String departamentName;
  final bool isSaved;

  ListModel({
    required this.id,
    required this.description,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.info,
    required this.name,
    required this.phone,
    required this.price,
    required this.userName,
    required this.time,
    required this.departamentName,
    required this.isSaved,
  });

  static ListModel empty() => ListModel(
      id: 0,
      description: "",
      image1: "",
      image2: "",
      image3: "",
      image4: "",
      image5: "",
      info: "",
      name: "",
      phone: "",
      price: "",
      userName: "",
      time: "",
      departamentName: "",
      isSaved: false);
}
