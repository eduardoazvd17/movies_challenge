import 'package:flutter/foundation.dart';
import 'package:the_movie_challenge/app/shared/models/movie_details_model.dart';
import 'package:the_movie_challenge/app/shared/models/movie_model.dart';

abstract class IMoviesRepository {
  Future<List<MovieModel>> getMoviesList(int page);
  Future<MovieDetailsModel> getMovieData({@required String id});
}
