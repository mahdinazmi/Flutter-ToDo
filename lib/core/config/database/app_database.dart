import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:todo/data/data_sources/local/task/task_dao.dart';
import 'package:todo/data/models/task/task.dart';


part 'app_database.g.dart';

@Database(version: 1, entities: [TaskModel])
abstract class AppDatabase extends FloorDatabase {
  TaskDao get taskDao;
}