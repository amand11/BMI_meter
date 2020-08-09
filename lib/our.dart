import 'package:flutter/material.dart';
const Color bottomcolor = Colors.green;

class Our extends StatelessWidget {
  Our({@required this.mycolor, this.wid, this.function});
  final Color mycolor;
  final Widget wid;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        child: wid,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: mycolor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class BottomUp extends StatelessWidget {
  BottomUp({this.promt});
  final String promt;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bottomcolor,
      margin: EdgeInsets.only(top: 10.0),
      height: 50.0,
      padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
      width: double.infinity,
      child: Text(promt, style: TextStyle(fontSize: 21,), textAlign: TextAlign.center, ),
    );
  }
}
