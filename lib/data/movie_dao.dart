import 'package:floor/floor.dart';
import 'package:myapp/data/movie_model.dart';

@dao
abstract class MovieDao {
  @Query('SELECT * FROM MovieModel WHERE id = :id')
  Future<MovieModel?> findMovieById(int id);

  @Query('SELECT * FROM MovieModel WHERE id = :id')
  Stream<MovieModel?> findMovieByIdAsStream(int id);

  @Query('SELECT * FROM MovieModel')
  Future<List<MovieModel>> findAllTasks();

  @Query('SELECT * FROM MovieModel')
  Stream<List<MovieModel>> findAllTasksAsStream();

  @insert
  Future<void> insertMovie(MovieModel movie);

  @insert
  Future<void> insertMovies(List<MovieModel> movie);

  @update
  Future<void> updateMovie(MovieModel movie);
}
