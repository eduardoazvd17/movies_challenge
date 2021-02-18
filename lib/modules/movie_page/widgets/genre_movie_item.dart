import 'package:flutter/material.dart';

class GenreMovieItem extends StatelessWidget {
  final String title;

  GenreMovieItem({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(233, 236, 239, 1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        "${title.toUpperCase()}",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Color.fromRGBO(94, 103, 112, 1),
        ),
      ),
    );
  }
}
