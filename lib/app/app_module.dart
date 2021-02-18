import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:the_movie_challenge/app/modules/movie/movie_module.dart';
import 'package:the_movie_challenge/app/shared/repositories/movies_repository.dart';
import 'package:the_movie_challenge/app/shared/utils/base_url.dart';

import './app_widget.dart';
import './app_controller.dart';
import './modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind(
          (i) => Dio(
            BaseOptions(baseUrl: BASE_URL),
          ),
        ),
        Bind(
          (i) => MovieRepository(
            i.get<Dio>(),
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/movie', module: MovieModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
