import 'package:the_movie_challenge/app/shared/models/genre_model.dart';

abstract class IGenreRepository {
  Future<List<GenreModel>> getGenres();
}
