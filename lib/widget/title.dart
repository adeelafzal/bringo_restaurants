import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {

  final String title;

  TitleWidget({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, top: 8, bottom: 8),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20),
        ),
      ),
    );
  }
}
