import 'package:flutter/material.dart';
import 'package:flutter_code/bmi/constants.dart';

import 'main_screen.dart';

class ResultScreen extends StatelessWidget {
  final String gender;
  final double age;
  final double weight;
  final double height;
  final double result;
  final String description;

  ResultScreen({
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
    required this.result,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(kDarkGray),
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: const Color(kDarkGray),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Your Result",
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Color(kValueColor),
            ),
          ),
          Center(
            child: Container(
              width: 350.0,
              height: 500.0,
              decoration: BoxDecoration(
                color: const Color(kLightGray),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    description,
                    style: const TextStyle(
                      color: Color(kMainOrange),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    result.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Color(kValueColor),
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    desc(gender, age, weight, height),
                    style: const TextStyle(
                      color: Color(kValueColor),
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 350.0,
            height: 75.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(kMainOrange),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text(
                "Back to Calculate",
                style: TextStyle(
                  color: Color(kValueColor),
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String desc(String gender, double age, double weight, double height) {
    String msg =
        "Gender: $gender\nAge: ${age.round()}\nHeight: ${height.round()} cm\nWeight: ${weight.round()} kg";
    return msg;
  }
}
