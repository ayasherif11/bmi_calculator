import 'dart:ui';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'result.dart';


main() {
  runApp(MaterialApp(home: BMI()));
}

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {

  double heightVal = 100;
   double weightVal = 20;
   int radioVal = 0;


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
        ),
        body: Material(
          color: Color(0xFFD1D4C9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    )),
                width: w * .8,
                height: h * .2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pick your your height:",
                        style: TextStyle(
                            color: Color(0xFF1C2938),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Slider(
                        activeColor: Color(0xFF1C2938),
                        inactiveColor: Color(0xFFD1D4C9),

                        min: 90,
                        max: 220, // divisions: 1,
                        onChanged: (double val) {
                          setState(() {
                            heightVal = val;
                          });
                        },
                        value: heightVal,

                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Color(0xFF1C2938), fontSize: 20),
                              children: [
                                TextSpan(
                                    text: "Height is : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300)),
                                TextSpan(
                                    text: "${heightVal.round().toString()}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: " CM",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300)),
                              ]),
                        ),
                      ),
                    ]),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    )),
                width: w * .8,
                height: h * .2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pick your your weight:",
                        style: TextStyle(
                            color: Color(0xFF1C2938),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Slider(
                        activeColor: Color(0xFF1C2938),
                        inactiveColor: Color(0xFFD1D4C9),
                        min: 20,
                        max: 300,
                        // divisions: 1,
                        onChanged: (double val) {
                          setState(() {
                            weightVal = val;
                          });
                        },
                        value: weightVal,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Color(0xFF1C2938), fontSize: 20),
                              children: [
                                TextSpan(
                                    text: "Weight is : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300)),
                                TextSpan(
                                    text: "${weightVal.round().toString()}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: " KG",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300)),
                              ]),
                        ),
                      ),
                    ]),
              ),
              Container(
                  padding: EdgeInsets.only(left: w * .04),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Choose your gender:",
                    style: TextStyle(
                        color: Color(0xFF1C2938),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        )),
                    width: w * .4,
                    height: h * .16,
                    child: ListTile(
                      leading: Radio(
                        activeColor: Color(0xFF1C2938),
                        groupValue: radioVal,
                        value: 1,
                        onChanged: (int? value) {
                          setState(() {
                            radioVal = value!;
                          });
                        },
                      ),
                      title: Image.asset(
                        "assets/images/female.png",
                        width: w * .3,
                        height: h * .14,
                      ),
                    ),
                  ),
                  SizedBox(width: w * .05),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        )),
                    width: w * .4,
                    height: h * .16,
                    child: ListTile(
                      leading: Radio(
                        activeColor: Color(0xFF1C2938),
                        groupValue: radioVal,
                        value: 2,
                        onChanged: (int? value) {
                          setState(() {
                            radioVal = value!;
                          });
                        },
                      ),
                      title: Image.asset(
                        "assets/images/male.png",
                        width: w * .3,
                        height: h * .14,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    // color: Color(0xFF1C2938),
                    borderRadius: BorderRadius.all(
                  Radius.circular(30),
                )),
                width: w * .5,
                height: h * .06,
                child: Builder(
                  builder: (context) => RaisedButton(
                    onPressed: () async {

                      Calculate calc=Calculate(height: heightVal,weight: weightVal);

                       Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimatedResult(
                         r:calc.Result(),
                         x: calc.Comments(),
                       )));
                    },
                    clipBehavior: Clip.antiAlias,
                    elevation: 5,
                    color: Color(0xFF1C2938),
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          color: Color(0xFFEEEEEE),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
