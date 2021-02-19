import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:the_movie_challenge/modules/application/repositories/movies_repository.dart';
import 'package:the_movie_challenge/modules/application/utils/base_url.dart';
import 'package:the_movie_challenge/modules/home_page/home_module.dart';
import 'package:the_movie_challenge/modules/movie_page/movie_module.dart';

import 'widgets/app_widget.dart';
import 'controllers/app_controller.dart';

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
        ModularRouter('/movie_page', module: MovieModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
