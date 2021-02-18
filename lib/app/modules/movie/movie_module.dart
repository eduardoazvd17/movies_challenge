import 'package:the_movie_challenge/app/shared/infra/http/dio/movies_repository.dart';

import 'stores/movie_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/movie_page.dart';

class MovieModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => MovieController(
            i.get<MovieRepository>(),
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/:id',
          child: (_, args) => MoviePage(
            id: args.params["id"],
            posterPath: args.data,
          ),
        ),
      ];

  static Inject get to => Inject<MovieModule>.of();
}
