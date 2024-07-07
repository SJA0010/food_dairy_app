// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, library_private_types_in_public_api
// ignore_for_file: file_names, prefer_const_constructors
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female, unSelected }

class Logic {
  double calculateBMI(int height, int weight) {
    double bmi = weight / pow(height / 100, 2);
    return bmi;
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Gender selectedCard = Gender.unSelected;
  int sliderValue = 0;
  int weight = 40;
  int Age = 10;
  // int height=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 138, 11, 160),
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = Gender.male;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255, 138, 11, 160),
                          ),
                          color: selectedCard == Gender.male
                              ? Color.fromARGB(255, 138, 11, 160)
                              : Colors.black,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              FontAwesomeIcons.mars,
                              color: Colors.white,
                              size: 95,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = Gender.female;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedCard == Gender.female
                              ? Color.fromARGB(255, 138, 11, 160)
                              : Colors.black,
                          border: Border.all(
                            color: Color.fromARGB(255, 138, 11, 160),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              FontAwesomeIcons.venus,
                              color: Colors.white,
                              size: 95,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                          border: Border.all(
                            color: Color.fromARGB(255, 138, 11, 160),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Height',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  sliderValue.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 75),
                                ),
                                Text(
                                  "cm",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 138, 11, 160),
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (sliderValue < 250) {
                                        sliderValue++;
                                      }
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 138, 11, 160),
                                    radius: 20,
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Slider(
                                  value: sliderValue.toDouble(),
                                  min: 0.0,
                                  max: 250.0,
                                  onChanged: (value) {
                                    setState(() {
                                      sliderValue = value.toInt();
                                    });
                                  },
                                  inactiveColor: Colors.white,
                                  activeColor:
                                      Color.fromARGB(255, 138, 11, 160),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (sliderValue > 0) sliderValue--;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 138, 11, 160),
                                    radius: 20,
                                    child: Icon(
                                      FontAwesomeIcons.minus,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                          border: Border.all(
                            color: Color.fromARGB(255, 138, 11, 160),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Weight',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              '$weight',
                              style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 138, 11, 160),
                                    radius: 25,
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (weight > 0) weight--;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 138, 11, 160),
                                    radius: 25,
                                    child: Icon(
                                      FontAwesomeIcons.minus,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                          border: Border.all(
                            color: Color.fromARGB(255, 138, 11, 160),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Age',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$Age',
                              style: TextStyle(
                                  fontSize: 60,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Age++;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 138, 11, 160),
                                    radius: 25,
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (Age > 0) Age--;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 138, 11, 160),
                                    radius: 25,
                                    child: Icon(
                                      FontAwesomeIcons.minus,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            height: sliderValue,
                            weight: weight,
                            age: Age,
                          )),
                );
              },
              child: Container(
                height: 80,
                width: double.infinity,
                color: Color.fromARGB(255, 138, 11, 160),
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatefulWidget {
  int height;
  int weight;
  int age;
  ResultPage({
    super.key,
    required this.height,
    required this.weight,
    required this.age,
  });

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double bmires = 0;
  //int bmiAge = Age;
  @override
  void initState() {
    Logic l = Logic();
    bmires = l.calculateBMI(widget.height, widget.weight);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 138, 11, 160),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI RESULT IS :",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                bmires.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 138, 11, 160)),
              ),
              Text(
                "YOUR AGE IS :",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                '${widget.age}',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 138, 11, 160)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
