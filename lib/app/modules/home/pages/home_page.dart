import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../stores/home_controller.dart';

import './skeleton_home_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Filmes"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  ScrollController _scrollController;

  _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      controller.loadNewPage();
      print(controller.currentPage);
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    controller.searchMoviesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Observer(
            builder: (_) {
              if (controller.genreFuture.status == FutureStatus.rejected) {
                return Center(
                  child: RaisedButton.icon(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: controller.fetchGenres,
                    icon: Icon(Icons.refresh),
                    label: Text(
                      'Oops! Ocorreu um erro, tente novamente',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }

              if (controller.genreFuture.status == FutureStatus.pending) {
                return Center(
                  child: SkeletonHomePage(),
                );
              }

              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 176),
                    child: Observer(
                      builder: (_) {
                        if (controller.movieFuture.status ==
                            FutureStatus.rejected) {
                          return Center(
                            child: RaisedButton.icon(
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              onPressed: controller.loadNewPage,
                              icon: Icon(Icons.refresh),
                              label: Text(
                                'Oops! Ocorreu um erro, tente novamente',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        }

                        if (controller.movieList.length == 0) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return ListView.separated(
                          controller: _scrollController,
                          padding: EdgeInsets.only(top: 66, bottom: 57),
                          itemCount: controller.filteredItems.length + 1,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 16,
                          ),
                          itemBuilder: (context, index) {
                            if (index == controller.filteredItems.length &&
                                index > 0) {
                              return Center(
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  alignment: Alignment.center,
                                  child: Opacity(
                                    opacity:
                                        controller.searchByInputingText.isEmpty
                                            ? 1.0
                                            : 0.0,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              );
                            } else if (index ==
                                    controller.filteredItems.length &&
                                index == 0) {
                              return Center(
                                child: Text(
                                  'Nenhum item encontrado!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            } else {
                              var movie = controller.filteredItems[index];
                              return InkWell(
                                onTap: () {
                                  Modular.to.pushNamed(
                                    '/movie/${movie.id}',
                                    arguments: movie.posterPath,
                                  );
                                },
                                child: Hero(
                                  tag: movie.id.toString(),
                                  child: movieItem(
                                    size,
                                    title: movie.title,
                                    genres: controller.getGenresFromMovies(
                                      movie.genreIds,
                                    ),
                                    image: movie.posterPath,
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 245,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.69, 1],
                          colors: [
                            Color.fromRGBO(255, 255, 255, 1),
                            Color.fromRGBO(255, 255, 255, 0),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appBar(widget.title),
                          searchFilms(size),
                          listOfCategories(size),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget movieItem(Size size, {String title, String genres, String image}) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      height: 470,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://image.tmdb.org/t/p/w780/$image",
          ),
        ),
        color: Color.fromRGBO(241, 243, 245, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 162,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.43, 1],
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 63),
                    Color.fromRGBO(0, 0, 0, 1),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 296,
                    child: Text(
                      '$title'.toUpperCase(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 296,
                    child: Text(
                      '$genres',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listOfCategories(Size size) {
    return Container(
      height: 24,
      margin: EdgeInsets.only(top: 16),
      width: size.width,
      child: Observer(
        builder: (_) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 21.5),
            scrollDirection: Axis.horizontal,
            itemCount: controller.genreList.length,
            separatorBuilder: (context, index) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              var item = controller.genreList[index];

              return Observer(
                builder: (_) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _scrollController.position.jumpTo(0.0);
                      });

                      controller.onChangeCategory(
                        index: index,
                        id: item.id,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        // vertical: 4,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: controller.selectedCategory == index
                            ? Color.fromRGBO(0, 56, 76, 1)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(
                          width: 1,
                          color: controller.selectedCategory == index
                              ? Color.fromRGBO(0, 56, 76, 1)
                              : Color.fromRGBO(241, 243, 245, 1),
                        ),
                      ),
                      child: Text(
                        "${item.name}",
                        style: TextStyle(
                          fontSize: 12,
                          color: controller.selectedCategory == index
                              ? Colors.white
                              : Color.fromRGBO(0, 56, 76, 1),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget searchFilms(Size size) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 21.5),
      child: TextField(
        onChanged: controller.onChangeText,
        controller: controller.searchMoviesController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(241, 243, 245, 1),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(100),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Color.fromRGBO(94, 103, 112, 1),
          ),
          suffixIcon: controller.searchByInputingText.length > 0
              ? IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    controller.clearText();
                  },
                )
              : null,
          hintText: 'Pesquise filmes',
          hintStyle: TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(94, 103, 112, 1),
          ),
        ),
      ),
    );
  }

  Widget appBar(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 48, left: 21.5, bottom: 24),
      child: Text(
        '$title',
        style: TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(52, 58, 64, 1),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
