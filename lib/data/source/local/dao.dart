
import 'package:floor/floor.dart';

import 'floor_entity.dart';

@dao
abstract class Dao {

  @Query('SELECT * FROM FloorEntity')
  Future<List<FloorEntity>> getAllItems();
  
  @insert
  Future<void> addItem(FloorEntity floorEntity);

  @delete
  Future<void> deleteItem(FloorEntity floorEntity);

}