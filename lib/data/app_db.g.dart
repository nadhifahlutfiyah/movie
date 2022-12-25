// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDb {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDbBuilder databaseBuilder(String name) => _$AppDbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDbBuilder inMemoryDatabaseBuilder() => _$AppDbBuilder(null);
}

class _$AppDbBuilder {
  _$AppDbBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDbBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDbBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDb> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDb();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDb extends AppDb {
  _$AppDb([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao? _movieDaocInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MovieModel` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL, `rating` REAL NOT NULL, `genre` TEXT NOT NULL, `year` INTEGER NOT NULL, `time` INTEGER NOT NULL, `image` TEXT NOT NULL, `sinopsis` TEXT NOT NULL, `imgFromDevie` BLOB)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDaoc {
    return _movieDaocInstance ??= _$MovieDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _movieModelInsertionAdapter = InsertionAdapter(
            database,
            'MovieModel',
            (MovieModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'rating': item.rating,
                  'genre': item.genre,
                  'year': item.year,
                  'time': item.time,
                  'image': item.image,
                  'sinopsis': item.sinopsis,
                  'imgFromDevie': item.imgFromDevie
                },
            changeListener),
        _movieModelUpdateAdapter = UpdateAdapter(
            database,
            'MovieModel',
            ['id'],
            (MovieModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'rating': item.rating,
                  'genre': item.genre,
                  'year': item.year,
                  'time': item.time,
                  'image': item.image,
                  'sinopsis': item.sinopsis,
                  'imgFromDevie': item.imgFromDevie
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieModel> _movieModelInsertionAdapter;

  final UpdateAdapter<MovieModel> _movieModelUpdateAdapter;

  @override
  Future<MovieModel?> findMovieById(int id) async {
    return _queryAdapter.query('SELECT * FROM MovieModel WHERE id = ?1',
        mapper: (Map<String, Object?> row) => MovieModel(
            id: row['id'] as int?,
            title: row['title'] as String,
            rating: row['rating'] as double,
            genre: row['genre'] as String,
            year: row['year'] as int,
            time: row['time'] as int,
            image: row['image'] as String,
            sinopsis: row['sinopsis'] as String,
            imgFromDevie: row['imgFromDevie'] as Uint8List?),
        arguments: [id]);
  }

  @override
  Stream<MovieModel?> findMovieByIdAsStream(int id) {
    return _queryAdapter.queryStream('SELECT * FROM MovieModel WHERE id = ?1',
        mapper: (Map<String, Object?> row) => MovieModel(
            id: row['id'] as int?,
            title: row['title'] as String,
            rating: row['rating'] as double,
            genre: row['genre'] as String,
            year: row['year'] as int,
            time: row['time'] as int,
            image: row['image'] as String,
            sinopsis: row['sinopsis'] as String,
            imgFromDevie: row['imgFromDevie'] as Uint8List?),
        arguments: [id],
        queryableName: 'MovieModel',
        isView: false);
  }

  @override
  Future<List<MovieModel>> findAllTasks() async {
    return _queryAdapter.queryList('SELECT * FROM MovieModel',
        mapper: (Map<String, Object?> row) => MovieModel(
            id: row['id'] as int?,
            title: row['title'] as String,
            rating: row['rating'] as double,
            genre: row['genre'] as String,
            year: row['year'] as int,
            time: row['time'] as int,
            image: row['image'] as String,
            sinopsis: row['sinopsis'] as String,
            imgFromDevie: row['imgFromDevie'] as Uint8List?));
  }

  @override
  Stream<List<MovieModel>> findAllTasksAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM MovieModel',
        mapper: (Map<String, Object?> row) => MovieModel(
            id: row['id'] as int?,
            title: row['title'] as String,
            rating: row['rating'] as double,
            genre: row['genre'] as String,
            year: row['year'] as int,
            time: row['time'] as int,
            image: row['image'] as String,
            sinopsis: row['sinopsis'] as String,
            imgFromDevie: row['imgFromDevie'] as Uint8List?),
        queryableName: 'MovieModel',
        isView: false);
  }

  @override
  Future<void> insertMovie(MovieModel movie) async {
    await _movieModelInsertionAdapter.insert(movie, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertMovies(List<MovieModel> movie) async {
    await _movieModelInsertionAdapter.insertList(
        movie, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMovie(MovieModel movie) async {
    await _movieModelUpdateAdapter.update(movie, OnConflictStrategy.abort);
  }
}
