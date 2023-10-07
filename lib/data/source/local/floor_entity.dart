import 'package:floor/floor.dart';

import '../../model/joyla_model.dart';

@entity
class FloorEntity {
  @PrimaryKey(autoGenerate: false)
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

  FloorEntity(
    this.description,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.info,
    this.name,
    this.phone,
    this.price,
    this.userName,
    this.time,
    this.id,
  );
}
