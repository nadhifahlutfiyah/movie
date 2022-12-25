import 'dart:async';
import 'dart:typed_data';

import 'package:floor/floor.dart';
import 'package:myapp/data/movie_dao.dart';
import 'package:myapp/data/movie_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_db.g.dart';

@Database(version: 1, entities: [MovieModel])
abstract class AppDb extends FloorDatabase {
  MovieDao get movieDaoc;
}
