import 'package:the_movie_challenge/modules/application/models/genre_model.dart';

abstract class IGenreRepository {
  Future<List<GenreModel>> getGenres();
}
