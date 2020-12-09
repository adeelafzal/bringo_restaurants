import 'package:flutter/material.dart';

class ProfileCardWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  ProfileCardWidget({@required this.title,@required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Raleway',
            color: Colors.black,
          ),
        ),
        leading: Icon(
          icon,
          color: Colors.red,
        ),
      ),
    );
  }
}