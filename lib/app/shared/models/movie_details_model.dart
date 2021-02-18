import 'package:the_movie_challenge/app/modules/movie/models/credits_model.dart';
import 'package:the_movie_challenge/app/shared/models/production_company_model.dart';
import 'package:the_movie_challenge/app/shared/models/genre_model.dart';

class MovieDetailsModel {
  String title = "";
  String originalTitle = "";
  String overview = "";
  String releaseDate = "";
  String posterPath = "";
  double voteAverage = 0.0;
  List<GenreModel> genres = [];
  int runtime = 0;
  int budget = 0;
  List<ProductionCompanyModel> productionCompanies = [];
  CreditsModel creditsModel;

  MovieDetailsModel({
    this.title,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.genres,
    this.productionCompanies,
    this.posterPath,
    this.voteAverage,
    this.runtime,
    this.creditsModel,
    this.budget,
  });

  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'];
    runtime = json['runtime'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = new List<GenreModel>();
      json['genres'].forEach((v) {
        genres.add(new GenreModel.fromJSON(v));
      });
    }
    if (json['production_companies'] != null) {
      productionCompanies = new List<ProductionCompanyModel>();
      json['production_companies'].forEach((v) {
        productionCompanies.add(new ProductionCompanyModel.fromJson(v));
      });
    }
    creditsModel = json['credits'] != null
        ? new CreditsModel.fromJson(json['credits'])
        : null;
  }
}
