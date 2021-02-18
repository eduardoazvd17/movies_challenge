import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 48,
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title(Colors.grey),
                Padding(
                  padding: EdgeInsets.only(top: 24, bottom: 16),
                  child: searchBar(Colors.grey),
                ),
                listOfCategorie(Colors.grey),
                SizedBox(height: 20),
                listOfMovies(Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget listOfMovies(Color grey) {
  return Expanded(
    child: ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 20,
      ),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Container(
          height: 470,
          width: double.infinity,
          color: grey,
          child: Stack(
            children: [
              Positioned(
                bottom: 32,
                left: 24,
                child: Column(
                  children: [
                    Container(
                      height: 20,
                      width: 80,
                      color: Colors.white,
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 14,
                      width: 80,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget listOfCategorie(Color grey) {
  return Container(
    height: 30,
    child: ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        width: 8,
      ),
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          height: 24,
          width: 54,
          color: grey,
        );
      },
    ),
  );
}

Widget searchBar(Color grey) {
  return Container(
    height: 47,
    width: double.infinity,
    color: grey,
  );
}

Widget title(Color grey) {
  return Container(
    height: 22,
    width: 80,
    color: grey,
  );
}
