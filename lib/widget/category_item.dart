import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;

  CategoryItem({@required this.title, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 6,
          ),
          Icon(
            icon,
            size: 40,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            height: 4,
          ),
          Text(title,
          style:Theme.of(context).textTheme.title),
        ],
      ),
    );
  }
}
