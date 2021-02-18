import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:the_movie_challenge/app/modules/movie/models/cast_model.dart';
import 'package:the_movie_challenge/app/modules/movie/models/crew_model.dart';
import 'package:the_movie_challenge/app/shared/models/movie_details_model.dart';
import 'package:the_movie_challenge/app/shared/models/production_company_model.dart';

import 'package:the_movie_challenge/app/shared/repositories/interface_movies_repository.dart';

part 'movie_controller.g.dart';

@Injectable()
class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {
  final IMoviesRepository _moviesRepository;

  _MovieControllerBase(this._moviesRepository);

  @observable
  String id;

  @observable
  ObservableFuture<MovieDetailsModel> currentMovieFuture;

  @observable
  MovieDetailsModel currentMovieData;

  @observable
  bool status = false;

  @action
  getId(String currentId) {
    status = false;
    id = currentId;
    currentMovieFuture = _moviesRepository
        .getMovieData(
          id: id,
        )
        .asObservable();

    currentMovieFuture.whenComplete(
      () => currentMovieData = currentMovieFuture.value,
    );
    // currentMovieData.creditsModel.cast
    status = true;
  }

  String convertProductionCompanyModel(List<ProductionCompanyModel> companies) {
    return '${companies.map((company) => company.name)}'
        .replaceAll('(', '')
        .replaceAll(')', '');
  }

  String convertCast(List<CastModel> cast) {
    return '${cast.map((person) => person.name)}'
        .replaceAll('(', '')
        .replaceAll(')', '');
  }

  String convertDirector(List<CrewModel> crew) {
    String directors = '';

    crew.forEach(
      (currentCrew) => {
        if (currentCrew.job.contains("Director"))
          {
            directors = directors + "${currentCrew.name}, ",
          }
      },
    );

    return directors.substring(0, directors.length - 2);
  }

  String convertTime(int value) {
    int hour = value ~/ 60;
    int minutes = value % 60;

    return '${hour.toString()}h ${minutes.toString().padLeft(2, "0")}min';
  }
}
