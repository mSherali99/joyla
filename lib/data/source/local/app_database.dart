import 'dart:async';

import 'package:floor/floor.dart';
import 'package:joyla/data/source/local/dao.dart';
import 'package:joyla/data/source/local/floor_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [FloorEntity])
abstract class AppDatabase extends FloorDatabase {
  Dao get dao;
}