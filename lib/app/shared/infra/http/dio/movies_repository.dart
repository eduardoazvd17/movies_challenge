import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:the_movie_challenge/app/shared/constants/api_key.dart';
import 'package:the_movie_challenge/app/shared/models/movie_details_model.dart';
import 'package:the_movie_challenge/app/shared/repositories/interface_movies_repository.dart';

import 'package:the_movie_challenge/app/shared/models/movie_model.dart';

class MovieRepository implements IMoviesRepository {
  final Dio _dio;
  MovieRepository(this._dio);

  @override
  Future<List<MovieModel>> getMoviesList(int page) async {
    var response = await _dio.get(
      "/movie/popular?api_key=$API_KEY&language=pt-BR&page=$page",
    );

    List<MovieModel> movieList = <MovieModel>[];

    for (var json in (response.data["results"] as List)) {
      var movieModel = MovieModel.fromJSON(json);
      movieList.add(movieModel);
    }

    return movieList;
  }

  @override
  Future<MovieDetailsModel> getMovieData({@required String id}) async {
    var response = await _dio.get(
      "/movie/$id?api_key=$API_KEY&language=pt-BR&append_to_response=credits",
    );

    MovieDetailsModel movie = MovieDetailsModel.fromJson(
      response.data,
    );

    return movie;
  }
}
