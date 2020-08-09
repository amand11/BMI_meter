import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'our.dart';

Map <int, String> weightCat = {
  1 : 'Under Weight',
  2 : 'Normal',
  3: 'OverWeight'
};
Map <int, String> message = {
  1 : 'Eat More and Play less',
  2 : 'Your are Fit! Keep it up',
  3: 'Need Exercise, Do the Best you can'
};


class Result extends StatefulWidget {
  final int ans;
  final double bm;
  Result({this.bm, this.ans});
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          Text('Your BMI is', style: TextStyle(fontSize: 40.0),),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10.0),
                color: Colors.redAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(weightCat[widget.ans], textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0),),
                  Center(child: Text(widget.bm.toString(), style: TextStyle(fontSize: 90.0),)),
                  SizedBox(height: 10.0,),
                  Center(child: Text(message[widget.ans], style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),)),
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: (){
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: BottomUp(promt: "Recalculate",)
          ),
        ],
      ),
    );
  }
}
