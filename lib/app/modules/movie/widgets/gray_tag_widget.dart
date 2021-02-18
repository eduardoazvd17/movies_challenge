import 'package:flutter/material.dart';

class GrayTagWidget extends StatelessWidget {
  final String itemKey;
  final String itemValue;
  final double width;

  GrayTagWidget({
    @required this.itemKey,
    @required this.itemValue,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromRGBO(241, 243, 245, 1),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: Wrap(
        children: [
          Text(
            '$itemKey: ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(134, 142, 150, 1),
            ),
          ),
          SizedBox(width: 6),
          Text(
            '$itemValue',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(52, 58, 64, 1),
            ),
          ),
        ],
      ),
    );
  }
}
