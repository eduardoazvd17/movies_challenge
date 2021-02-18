import 'package:the_movie_challenge/app/modules/movie/models/cast_model.dart';
import 'package:the_movie_challenge/app/modules/movie/models/crew_model.dart';

class CreditsModel {
  List<CastModel> cast = [];
  List<CrewModel> crew = [];

  CreditsModel({this.cast, this.crew});

  CreditsModel.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = new List<CastModel>();
      json['cast'].forEach((v) {
        cast.add(new CastModel.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = new List<CrewModel>();
      json['crew'].forEach((v) {
        crew.add(new CrewModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cast != null) {
      data['cast'] = this.cast.map((v) => v.toJson()).toList();
    }
    if (this.crew != null) {
      data['crew'] = this.crew.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
