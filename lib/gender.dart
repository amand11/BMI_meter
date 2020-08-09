import 'package:flutter/material.dart';


class Gender extends StatelessWidget {
  final String gender;
  final IconData icon;

  Gender({this.gender, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 80.0,),
        SizedBox(height: 15.0,),
        Text(gender, style: TextStyle( fontSize: 18.0),),
      ],
    );
  }
}
