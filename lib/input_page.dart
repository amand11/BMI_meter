import 'package:bmi_calculator/Result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'our.dart';
import 'gender.dart';
import 'Result.dart';
import 'calculate.dart';

const Color activecolor = Colors.redAccent;
const Color bottomcolor = Colors.green;

enum Gnder{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gnder select;
  int height = 60;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
          children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(child: Our(mycolor: select == Gnder.male ? Colors.red : Colors.redAccent,
                      wid: Gender(icon: FontAwesomeIcons.mars, gender: "Male",),
                      function: (){
                      setState(() {
                        select = Gnder.male;
                      });
                      },
                    ),),
                    Expanded(child: Our(mycolor: select == Gnder.female ? Colors.red : Colors.redAccent,
                      wid: Gender(icon: FontAwesomeIcons.venus, gender: "Female",),
                      function: (){
                      setState(() {
                        select = Gnder.female;
                      });
                      },
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                children: <Widget>[
                  Expanded(child: Our(mycolor: Colors.redAccent,
                  wid: Column(
                    children: <Widget>[
                      Text('Height', style: TextStyle(
                        fontSize: 20.0
                      ),),
                      Text('${(height~/12).toString()}\' ${(height%12).toString()} Feets', style: TextStyle(
                        fontSize: 40.0,
                      ),),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Colors.lightGreen[600],
                          overlayColor: Colors.greenAccent[100],
                          activeTickMarkColor: Colors.green,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          activeColor: Colors.green[700],
                          inactiveColor: Colors.greenAccent,
                          min: 40.0,
                          max: 80.0,
                          onChanged: (double val){
                            setState(() {
                              height = val.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  )),
                ],
                ),
              ),
              Expanded(
                child: Row(
                children: <Widget>[
                  Expanded(child: Our(mycolor: Colors.redAccent,
                    wid: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Weight', style: TextStyle(fontSize: 18.0),),
                        Text('${weight.toString()} KG', style: TextStyle( fontSize: 34.0,),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            MyButton(
                              onPressed: (){
                                setState(() {
                                  weight-=1;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                            SizedBox(width: 10.0,),
                            MyButton(
                              onPressed: (){
                                setState(() {
                                  weight+=1;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(child: Our(mycolor: Colors.redAccent,
                    wid: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Age', style: TextStyle(fontSize: 18.0),),
                        Text('${age.toString()} ', style: TextStyle( fontSize: 34.0,),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            MyButton(
                              onPressed: (){
                                setState(() {
                                  age-=1;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                            SizedBox(width: 10.0,),
                            MyButton(
                              onPressed: (){
                                setState(() {
                                  age+=1;
                                });
                              },
                              child: Icon(Icons.add),
                            ),

                          ],
                        )
                      ],
                    ),
                  )),

                ],
                ),
              ),
            GestureDetector(
              onTap: (){
                setState(() {
                  Calculator as = Calculator(height: height,weight:  weight);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> Result(bm: as.bmi(),ans: as.cat(),),
                  ),);
                });
              },
              child: BottomUp(promt: "Calculate",)
            ),
          ],
      ),
    );
  }
}


class MyButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  MyButton({this.onPressed, this.child});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      onPressed: onPressed,
      elevation: 6.0,
      disabledElevation: 6.0,
      shape: CircleBorder(),
      constraints: BoxConstraints(
        minHeight: 45.0, minWidth: 45.0
      ),
      fillColor: Colors.green,
    );
  }
}
