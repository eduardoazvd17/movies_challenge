import 'package:flutter_modular/flutter_modular.dart';
import 'package:the_movie_challenge/modules/application/repositories/movies_repository.dart';
import 'package:the_movie_challenge/modules/movie_page/views/movie_page.dart';

import '../controllers/movie_controller.dart';

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
