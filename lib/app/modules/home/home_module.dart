import 'package:dio/dio.dart';
import 'package:the_movie_challenge/app/modules/home/infra/http/dio/genre_repository.dart';
import 'package:the_movie_challenge/app/shared/infra/http/dio/movies_repository.dart';

import 'stores/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => HomeController(
            i.get<GenreRepository>(),
            i.get<MovieRepository>(),
          ),
        ),
        Bind(
          (i) => GenreRepository(
            i.get<Dio>(),
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
