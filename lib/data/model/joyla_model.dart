// To parse this JSON data, do
//
//     final joylaModel = joylaModelFromJson(jsonString);

import 'dart:convert';

import 'listI_model.dart';

List<JoylaModel> joylaModelFromJson(String str) => List<JoylaModel>.from(json.decode(str).map((x) => JoylaModel.fromJson(x)));

String joylaModelToJson(List<JoylaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JoylaModel {
  String name;
  List<Item> items;

  JoylaModel({
    required this.name,
    required this.items,
  });

  factory JoylaModel.fromJson(Map<String, dynamic> json) => JoylaModel(
    name: json["name"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  int id;
  String description;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  String info;
  String name;
  MapLink mapLink;
  String phone;
  String price;
  String userName;
  String time;

  Item({
    required this.id,
    required this.description,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.info,
    required this.name,
    required this.mapLink,
    required this.phone,
    required this.price,
    required this.userName,
    required this.time,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    description: json["description"],
    image1: json["image1"],
    image2: json["image2"],
    image3: json["image3"],
    image4: json["image4"],
    image5: json["image5"],
    info: json["info"],
    name: json["name"],
    mapLink: mapLinkValues.map[json["mapLink"]]!,
    phone: json["phone"],
    price: json["price"],
    userName: json["userName"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "image1": image1,
    "image2": image2,
    "image3": image3,
    "image4": image4,
    "image5": image5,
    "info": info,
    "name": name,
    "mapLink": mapLinkValues.reverse[mapLink],
    "phone": phone,
    "price": price,
    "userName": userName,
    "time": time,
  };
}

enum MapLink {
  MAPLINK
}

final mapLinkValues = EnumValues({
  "maplink": MapLink.MAPLINK
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

