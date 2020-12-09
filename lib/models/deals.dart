import 'package:flutter/cupertino.dart';

class Deals {

  final String imageurl,
      title,
      duration,
      detail,
      rating,
      totalRate,
      distance,
      type;

  Deals({
    @required this.imageurl,
    @required this.title,
    @required this.duration,
    @required this.detail,
    @required this.rating,
    @required this.totalRate,
    @required this.distance,
    @required this.type,
  });
}
