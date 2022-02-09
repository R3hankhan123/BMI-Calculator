// ignore_for_file: camel_case_types, unnecessary_string_interpolations
import 'package:flutter/material.dart';

class ip extends StatefulWidget {
  const ip({Key? key}) : super(key: key);

  @override
  _ipState createState() => _ipState();
}

class _ipState extends State<ip> {
  late Color _favIconColor = Colors.black;
  late Color _favIconColor2 = Colors.black;
  late Color _color = Colors.red;
  final TextEditingController _age = TextEditingController();
  final TextEditingController _ht = TextEditingController();
  final TextEditingController _wt = TextEditingController();
  double _result = 0.0;
  String bmi = "";
  Future<void> Calculate() async {
    setState(() {
      int age = int.parse(_age.text);
      double weight = double.parse(_wt.text);
      double height = double.parse(_ht.text) / 100;
      if ((_age.toString().isNotEmpty && age > 0) ||
          (_wt.toString().isNotEmpty && weight > 0) ||
          (_ht.toString().isNotEmpty && height > 0)) {
        _result = (weight) / (height * height);
      }
      if (_result >= 25.0 && _result <= 29.99) {
        _color = Colors.red;
        bmi = "Overweight";
      } else if (_result >= 18.5 && _result < 25.0) {
        _color = Colors.greenAccent;
        bmi = "Healthy";
      } else if (_result > 29.9 && _result <= 34.99) {
        _color = Colors.red;
        bmi = "Obese I";
      } else if (_result >= 35 && _result <= 39.99) {
        _color = Colors.red;
        bmi = "Obese II";
      } else if (_result >= 40) {
        _color = Colors.red;
        bmi = "Obese III";
      } else {
        _color = Colors.red;
        bmi = "Underweight";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Center(
          child: (Text(
            'BMI Calculator',
            style: TextStyle(color: Colors.black),
          )),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(50, 1, 50, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _age,
                  autofocus: false,
                  decoration: const InputDecoration(
                      hintText: 'Enter Age',
                      fillColor: Colors.white,
                      filled: true,
                      icon: Icon(Icons.people_sharp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ))),
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _ht,
                  autofocus: false,
                  decoration: const InputDecoration(
                      hintText: 'Enter Height in cm',
                      fillColor: Colors.white,
                      filled: true,
                      icon: Icon(Icons.trending_up),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ))),
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _wt,
                  autofocus: false,
                  decoration: const InputDecoration(
                      hintText: 'Enter Weight in Kg',
                      fillColor: Colors.white,
                      filled: true,
                      icon: Icon(Icons.monitor_weight),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ))),
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Choose Your Gender',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            icon: const Icon(Icons.male_sharp),
                            iconSize: 25,
                            color: _favIconColor,
                            splashColor: Colors.lightBlueAccent,
                            onPressed: () {
                              setState(() {
                                if (_favIconColor == Colors.black) {
                                  _favIconColor =
                                      Color.fromARGB(255, 20, 114, 190);
                                  _favIconColor2 = Colors.black;
                                } else {
                                  _favIconColor = Colors.black;
                                }
                              });
                            })),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              icon: const Icon(Icons.female_sharp),
                              iconSize: 25,
                              color: _favIconColor2,
                              onPressed: () {
                                setState(() {
                                  if (_favIconColor2 == Colors.black) {
                                    _favIconColor2 = Colors.pink;
                                    _favIconColor = Colors.black;
                                  } else {
                                    _favIconColor2 = Colors.black;
                                  }
                                });
                              })),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.greenAccent,
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: Calculate,
              ),
              Center(
                child: Text(
                  ' "Your BMI is ${_result.toStringAsFixed(2)}",',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.teal),
                ),
              ),
              Center(
                child: Text(
                  "$bmi",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: _color),
                ),
              ),
            ],
          )),
    );
  }
}
