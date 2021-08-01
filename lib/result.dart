
import 'package:flutter/material.dart';
import 'dart:math';

class Calculate{
  var height,weight;
  Calculate({this.height,this.weight});


  var result;

  String Result(){
     result  = weight / pow(height/100 , 2);
    return result.toStringAsFixed(1);
  }
  String Comments() {

    if (result >= 25) {
      return 'Take care of your health  "/ ';
    } else if (18.5 <= result && result <= 24.9) {
      return 'Normal';
    } else if(result <= 18.4)
      {
        return 'كُل يسطا واتغذي كدا :)';
      }
    else {
      return 'Invalid Values';
    }
  }



}


class AnimatedResult extends StatefulWidget {
  AnimatedResult({required this.r,required this.x});
   final String r;
   final String x;

  @override
  _AnimatedResultState createState() => _AnimatedResultState();
}

class _AnimatedResultState extends State<AnimatedResult> {
  double padValue = 0.0;
  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(
        appBar: AppBar(
        title: Text("BMI Calculator"),
    centerTitle: true,
    backgroundColor: Color(0xFF1C2938),
    elevation: 4,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () { Navigator.pop(context); },),
    ),

    body: Material(
      color: Color(0xFFD1D4C9),
      child: GestureDetector(
        onTap: (){
        _updatePadding(padValue == 0.0 ? 20.0 : 0.0);
      },
        child: Container(
          width: w,
          height: h,
          padding: EdgeInsets.symmetric(vertical: h*.3,horizontal: w*.01),

          child: AnimatedPadding(
            padding: EdgeInsets.all(padValue),
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            child:Container(

              decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  )),

              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left:15,bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Text("Your BMI:",style: TextStyle(
                      color: Color(0xFF1C2938),

                      fontWeight: FontWeight.w900,
                      fontSize: 25)),
                ),

                Text(widget.r,style: TextStyle(
                    color: Color(0xFF1C2938),
                    fontWeight: FontWeight.w500,
                    fontSize: 24)),
                Container(
                  padding: EdgeInsets.only(left:15,bottom: 10,top: 20),
                  alignment: Alignment.topLeft,
                  child: Text("Note :",style: TextStyle(
                      color: Color(0xFF1C2938),

                      fontWeight: FontWeight.w900,
                      fontSize: 25)),
                ),

                Text(widget.x,style: TextStyle(
                    color: Color(0xFF1C2938),
                    fontWeight: FontWeight.w500,
                    fontSize: 24)),

              ],
          ),
            ),
          ),
        ),
      ),
    )));
  }
}

