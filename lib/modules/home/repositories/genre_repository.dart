import 'package:dio/dio.dart';
import 'package:the_movie_challenge/modules/application/models/genre_model.dart';
import 'package:the_movie_challenge/modules/application/utils/api_key.dart';

import 'interface_genre_repository.dart';

class GenreRepository implements IGenreRepository {
  final Dio _dio;
  GenreRepository(this._dio);

  @override
  Future<List<GenreModel>> getGenres() async {
    var response = await _dio.get(
      "/genre/movie/list?api_key=$API_KEY&language=pt-BR",
    );

    List<GenreModel> genreList = <GenreModel>[];

    for (var json in (response.data["genres"] as List)) {
      var genreModel = GenreModel.fromJSON(json);
      genreList.add(genreModel);
    }

    return genreList;
  }
}
