import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:the_movie_challenge/app/modules/home/repositories/interface_genre_repository.dart';
import 'package:the_movie_challenge/app/shared/repositories/interface_movies_repository.dart';

import 'package:the_movie_challenge/app/shared/models/movie_model.dart';
import 'package:the_movie_challenge/app/shared/models/genre_model.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IGenreRepository _genreRepository;
  final IMoviesRepository _moviesRepository;

  var searchMoviesController = new TextEditingController();

  _HomeControllerBase(this._genreRepository, this._moviesRepository) {
    fetchGenres();
  }

  @observable
  ObservableFuture<List<GenreModel>> genreFuture = ObservableFuture.value([]);
  @observable
  ObservableList<GenreModel> genreList = <GenreModel>[].asObservable();

  @observable
  ObservableFuture<List<MovieModel>> movieFuture = ObservableFuture.value([]);
  @observable
  ObservableList<MovieModel> movieList = <MovieModel>[].asObservable();

  @observable
  ObservableList<MovieModel> filteredItems = <MovieModel>[].asObservable();

  @observable
  int selectedCategory = 0;

  @observable
  int currentPage = 1;

  @observable
  String searchByInputingText = "";

  @action
  onChangeText(String newValue) {
    searchByInputingText = newValue;

    List<MovieModel> filteredMovies = [];

    filteredMovies = movieList
        .where((movie) => movie.title.contains(searchByInputingText))
        .toList();

    filteredItems.replaceRange(0, filteredItems.length, filteredMovies);
  }

  @action
  clearText() {
    searchByInputingText = "";
    searchMoviesController.clear();
    filterMovies();
  }

  @action
  onChangeCategory({@required int index, @required int id}) {
    selectedCategory = index;
    clearText();
    filterMovies();
  }

  @action
  loadNewPage() {
    currentPage += 1;

    fetchMovies();
  }

  @action
  fetchGenres() {
    genreFuture = _genreRepository.getGenres().asObservable();

    genreFuture.whenComplete(
      () => {
        genreList.addAll(genreFuture.value),
        fetchMovies(),
      },
    );
  }

  @action
  fetchMovies() {
    movieFuture = _moviesRepository.getMoviesList(currentPage).asObservable();

    List<MovieModel> filteredMovies = [];

    movieFuture.whenComplete(
      () {
        movieList.addAll(movieFuture.value);

        filteredMovies = movieFuture.value
            .where(
              (movie) =>
                  movie.genreIds.contains(genreList[selectedCategory].id),
            )
            .toList();

        filteredItems.addAll(filteredMovies);
      },
    );
  }

  @action
  filterMovies() {
    List<MovieModel> filteredMovies = [];

    filteredMovies = movieList
        .where(
            (movie) => movie.genreIds.contains(genreList[selectedCategory].id))
        .toList();

    filteredItems.replaceRange(0, filteredItems.length, filteredMovies);
  }

  @action
  String getGenresFromMovies(List<int> listOfgenreId) {
    String currentGenre = "";

    listOfgenreId.forEach(
      (id) {
        genreList.forEach(
          (item) {
            if (item.id == id) {
              currentGenre.length == 0
                  ? currentGenre = "${item.name}"
                  : currentGenre = currentGenre + " - ${item.name}";
            }
          },
        );
      },
    );

    return currentGenre;
  }
}
