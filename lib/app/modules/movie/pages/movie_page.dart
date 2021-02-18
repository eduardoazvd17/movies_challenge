import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:the_movie_challenge/app/modules/movie/pages/skeleton_movie_page.dart';
import 'package:the_movie_challenge/app/modules/movie/widgets/genre_movie_item.dart';
import 'package:the_movie_challenge/app/modules/movie/widgets/gray_tag_widget.dart';
import 'package:the_movie_challenge/app/shared/models/genre_model.dart';

import '../stores/movie_controller.dart';

class MoviePage extends StatefulWidget {
  final String title;
  final String posterPath;
  final String id;
  const MoviePage({Key key, this.title = "Movie", this.id, this.posterPath})
      : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends ModularState<MoviePage, MovieController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    controller.getId(widget.id);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Observer(
          builder: (_) {
            if (controller.currentMovieFuture.status == FutureStatus.rejected) {
              return Center(
                child: Icon(Icons.error_outline_outlined),
              );
            }

            if (controller.currentMovieFuture.status == FutureStatus.pending) {
              return SkeletonMoviePage();
            }

            var movie = controller.currentMovieData;
            return ListView(
              children: <Widget>[
                header(
                  size,
                  heroKey: widget.id,
                  posterPath: widget.posterPath,
                ),
                SizedBox(height: 32),
                rating(
                  voteAverage: movie.voteAverage,
                ),
                title(
                  title: movie.title,
                  originalTitle: movie.originalTitle,
                ),
                Column(
                  children: [
                    yearDurationInformation(
                      year: movie.releaseDate.substring(0, 4),
                      duration: controller.convertTime(movie.runtime),
                    ),
                    SizedBox(height: 12),
                    genres(context, listOfGenres: movie.genres),
                  ],
                ),
                description(
                  size,
                  description: movie.overview,
                  value: movie.budget.toString(),
                  companies: controller.convertProductionCompanyModel(
                    movie.productionCompanies,
                  ),
                ),
                team(
                  cast: controller.convertCast(
                    movie.creditsModel.cast,
                  ),
                  crew: controller.convertDirector(
                    movie.creditsModel.crew,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget team({@required String cast, @required String crew}) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20, bottom: 90),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Diretor",
          style: TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(94, 103, 112, 1),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 32),
          child: Text(
            crew,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color.fromRGBO(52, 58, 64, 1),
            ),
          ),
        ),
        Text(
          "Elenco",
          style: TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(94, 103, 112, 1),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            cast,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.justify,
            softWrap: true,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color.fromRGBO(52, 58, 64, 1),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget description(Size size,
    {@required String description,
    @required String value,
    @required String companies}) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(
          top: 53,
          left: 20,
          right: 20,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Descrição",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(94, 103, 112, 1),
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Color.fromRGBO(52, 58, 64, 1),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
        child: Column(
          children: [
            GrayTagWidget(
              itemKey: "ORÇAMENTO",
              itemValue: identical(value, "0") ? "Não Informado" : "\$ $value",
              width: size.width,
            ),
            SizedBox(
              height: 4,
            ),
            GrayTagWidget(
              itemKey: "PRODUTORAS",
              itemValue: companies.isEmpty ? 'Não Informado' : companies,
              width: size.width,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget genres(BuildContext context, {@required List<GenreModel> listOfGenres}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Wrap(
        runSpacing: 8,
        spacing: 8,
        alignment: WrapAlignment.center,
        children: listOfGenres.map(
          (genre) {
            return GenreMovieItem(
              title: genre.name,
            );
          },
        ).toList()),
  );
}

Widget yearDurationInformation(
    {@required String year, @required String duration}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GrayTagWidget(
        itemKey: "Ano",
        itemValue: year,
      ),
      SizedBox(
        width: 12,
      ),
      GrayTagWidget(
        itemKey: "Duração",
        itemValue: duration,
      ),
    ],
  );
}

Widget title({@required String title, @required String originalTitle}) {
  return Container(
    margin: EdgeInsets.only(
      top: 32,
      bottom: 56,
      left: 20,
      right: 20,
    ),
    child: Column(
      children: [
        Text(
          title.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(52, 58, 64, 1),
            fontSize: 14,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Título original: $originalTitle',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(94, 103, 112, 1),
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget rating({@required double voteAverage}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$voteAverage',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: Color.fromRGBO(0, 56, 76, 1),
        ),
      ),
      SizedBox(width: 4),
      Text(
        '/10',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Color.fromRGBO(134, 142, 150, 1),
        ),
      ),
    ],
  );
}

Widget header(
  Size size, {
  @required String heroKey,
  @required String posterPath,
}) {
  return Container(
    height: 450,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 20,
            top: 48,
          ),
          width: size.width,
          height: 300,
          color: Color.fromRGBO(245, 245, 245, 1),
          // color: Color.fromRGBO(245, 245, 245, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RaisedButton.icon(
                elevation: 2,
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 13),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                color: Color.fromRGBO(255, 255, 255, 1),
                textColor: Color.fromRGBO(109, 112, 112, 1),
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 12,
                  color: Color.fromRGBO(109, 112, 112, 1),
                ),
                label: Text(
                  'Voltar',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(109, 112, 112, 1),
                  ),
                ),
                onPressed: () {
                  Modular.to.pop();
                },
              ),
            ],
          ),
        ),
        Positioned(
          top: 130,
          left: size.width * 0.2,
          right: size.width * 0.2,
          child: Hero(
            tag: heroKey,
            child: posterPath.isEmpty
                ? Container(
                    height: 320,
                    width: 220,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                : Container(
                    height: 320,
                    width: 220,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://image.tmdb.org/t/p/w780/$posterPath",
                        ),
                      ),
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
          ),
        ),
      ],
    ),
  );
}
