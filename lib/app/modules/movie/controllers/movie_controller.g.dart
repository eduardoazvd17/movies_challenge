// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MovieController = BindInject(
  (i) => MovieController(i<IMoviesRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieController on _MovieControllerBase, Store {
  final _$idAtom = Atom(name: '_MovieControllerBase.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$currentMovieFutureAtom =
      Atom(name: '_MovieControllerBase.currentMovieFuture');

  @override
  ObservableFuture<MovieDetailsModel> get currentMovieFuture {
    _$currentMovieFutureAtom.reportRead();
    return super.currentMovieFuture;
  }

  @override
  set currentMovieFuture(ObservableFuture<MovieDetailsModel> value) {
    _$currentMovieFutureAtom.reportWrite(value, super.currentMovieFuture, () {
      super.currentMovieFuture = value;
    });
  }

  final _$currentMovieDataAtom =
      Atom(name: '_MovieControllerBase.currentMovieData');

  @override
  MovieDetailsModel get currentMovieData {
    _$currentMovieDataAtom.reportRead();
    return super.currentMovieData;
  }

  @override
  set currentMovieData(MovieDetailsModel value) {
    _$currentMovieDataAtom.reportWrite(value, super.currentMovieData, () {
      super.currentMovieData = value;
    });
  }

  final _$statusAtom = Atom(name: '_MovieControllerBase.status');

  @override
  bool get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(bool value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$_MovieControllerBaseActionController =
      ActionController(name: '_MovieControllerBase');

  @override
  dynamic getId(String currentId) {
    final _$actionInfo = _$_MovieControllerBaseActionController.startAction(
        name: '_MovieControllerBase.getId');
    try {
      return super.getId(currentId);
    } finally {
      _$_MovieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
currentMovieFuture: ${currentMovieFuture},
currentMovieData: ${currentMovieData},
status: ${status}
    ''';
  }
}
