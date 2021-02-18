// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<IGenreRepository>(), i<IMoviesRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$genreFutureAtom = Atom(name: '_HomeControllerBase.genreFuture');

  @override
  ObservableFuture<List<GenreModel>> get genreFuture {
    _$genreFutureAtom.reportRead();
    return super.genreFuture;
  }

  @override
  set genreFuture(ObservableFuture<List<GenreModel>> value) {
    _$genreFutureAtom.reportWrite(value, super.genreFuture, () {
      super.genreFuture = value;
    });
  }

  final _$genreListAtom = Atom(name: '_HomeControllerBase.genreList');

  @override
  ObservableList<GenreModel> get genreList {
    _$genreListAtom.reportRead();
    return super.genreList;
  }

  @override
  set genreList(ObservableList<GenreModel> value) {
    _$genreListAtom.reportWrite(value, super.genreList, () {
      super.genreList = value;
    });
  }

  final _$movieFutureAtom = Atom(name: '_HomeControllerBase.movieFuture');

  @override
  ObservableFuture<List<MovieModel>> get movieFuture {
    _$movieFutureAtom.reportRead();
    return super.movieFuture;
  }

  @override
  set movieFuture(ObservableFuture<List<MovieModel>> value) {
    _$movieFutureAtom.reportWrite(value, super.movieFuture, () {
      super.movieFuture = value;
    });
  }

  final _$movieListAtom = Atom(name: '_HomeControllerBase.movieList');

  @override
  ObservableList<MovieModel> get movieList {
    _$movieListAtom.reportRead();
    return super.movieList;
  }

  @override
  set movieList(ObservableList<MovieModel> value) {
    _$movieListAtom.reportWrite(value, super.movieList, () {
      super.movieList = value;
    });
  }

  final _$filteredItemsAtom = Atom(name: '_HomeControllerBase.filteredItems');

  @override
  ObservableList<MovieModel> get filteredItems {
    _$filteredItemsAtom.reportRead();
    return super.filteredItems;
  }

  @override
  set filteredItems(ObservableList<MovieModel> value) {
    _$filteredItemsAtom.reportWrite(value, super.filteredItems, () {
      super.filteredItems = value;
    });
  }

  final _$selectedCategoryAtom =
      Atom(name: '_HomeControllerBase.selectedCategory');

  @override
  int get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(int value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  final _$currentPageAtom = Atom(name: '_HomeControllerBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$searchByInputingTextAtom =
      Atom(name: '_HomeControllerBase.searchByInputingText');

  @override
  String get searchByInputingText {
    _$searchByInputingTextAtom.reportRead();
    return super.searchByInputingText;
  }

  @override
  set searchByInputingText(String value) {
    _$searchByInputingTextAtom.reportWrite(value, super.searchByInputingText,
        () {
      super.searchByInputingText = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic onChangeText(String newValue) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.onChangeText');
    try {
      return super.onChangeText(newValue);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearText() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.clearText');
    try {
      return super.clearText();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangeCategory({@required int index, @required int id}) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.onChangeCategory');
    try {
      return super.onChangeCategory(index: index, id: id);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic loadNewPage() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.loadNewPage');
    try {
      return super.loadNewPage();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchGenres() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.fetchGenres');
    try {
      return super.fetchGenres();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchMovies() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.fetchMovies');
    try {
      return super.fetchMovies();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterMovies() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.filterMovies');
    try {
      return super.filterMovies();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getGenresFromMovies(List<int> listOfgenreId) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getGenresFromMovies');
    try {
      return super.getGenresFromMovies(listOfgenreId);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
genreFuture: ${genreFuture},
genreList: ${genreList},
movieFuture: ${movieFuture},
movieList: ${movieList},
filteredItems: ${filteredItems},
selectedCategory: ${selectedCategory},
currentPage: ${currentPage},
searchByInputingText: ${searchByInputingText}
    ''';
  }
}
