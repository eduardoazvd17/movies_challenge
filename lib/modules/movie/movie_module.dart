import 'package:the_movie_challenge/app/modules/movie/controllers/movie_controller.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:the_movie_challenge/app/modules/movie/views/movie_page.dart';
import 'package:the_movie_challenge/app/shared/repositories/movies_repository.dart';

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
