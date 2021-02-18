import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Column(
              children: [
                movieImage(),
                rating(),
                title(),
                informations(),
                genre(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget genre() {
  return Container(
    margin: EdgeInsets.only(top: 12),
    height: 40,
    width: 100,
    decoration: BoxDecoration(
      border: Border.all(
        width: 5,
        color: Colors.grey,
      ),
    ),
  );
}

Widget informations() {
  return Container(
    height: 40,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 35,
          width: 98,
          color: Colors.grey,
        ),
        SizedBox(width: 8),
        Container(
          height: 35,
          width: 98,
          color: Colors.grey,
        ),
      ],
    ),
  );
}

Widget title() {
  return Column(
    children: [
      Container(
        height: 20,
        width: 130,
        color: Colors.grey,
      ),
      Container(
        margin: EdgeInsets.only(top: 12, bottom: 32),
        height: 12,
        width: 150,
        color: Colors.grey,
      ),
    ],
  );
}

Widget rating() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 30),
    height: 30,
    width: 70,
    color: Colors.grey,
  );
}

Widget movieImage() {
  return Container(
    margin: EdgeInsets.only(top: 100),
    height: 320,
    width: 220,
    color: Colors.grey,
  );
}
