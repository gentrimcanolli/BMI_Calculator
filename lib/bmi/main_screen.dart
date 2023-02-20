import 'dart:math';
import 'package:flutter/material.dart';
import 'results_screen.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
  unSelected,
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _heightValue = 170;
  double _weightValue = 100;
  double _ageValue = 20;
  double result = 0;
  Gender selectedGender = Gender.unSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(kDarkGray),
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: const Color(kDarkGray),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                child: Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                    color: const Color(kLightGray),
                    border: Border.all(
                      width: 3.0,
                      color: genderColorPicker(
                        selectedGender,
                        Gender.male,
                        kLightGray,
                        kMainOrange,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        size: 70.0,
                        color: genderColorPicker(
                          selectedGender,
                          Gender.male,
                          kGenderIconInactive,
                          kMaleBlue,
                        ),
                      ),
                      Text(
                        "Male",
                        style: TextStyle(
                          color: genderColorPicker(
                            selectedGender,
                            Gender.male,
                            kTextGray,
                            kValueColor,
                          ),
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                    color: const Color(kLightGray),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      width: 3.0,
                      color: genderColorPicker(
                        selectedGender,
                        Gender.female,
                        kLightGray,
                        kMainOrange,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.female,
                        size: 70.0,
                        color: genderColorPicker(
                          selectedGender,
                          Gender.female,
                          kGenderIconInactive,
                          kFemalePink,
                        ),
                      ),
                      Text(
                        "Female",
                        style: TextStyle(
                          color: genderColorPicker(
                            selectedGender,
                            Gender.female,
                            kTextGray,
                            kValueColor,
                          ),
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(kLightGray),
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: 170.0,
            width: 350.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Height",
                  style: TextStyle(
                    color: Color(kTextGray),
                    fontSize: 30.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _heightValue.round().toString(),
                      style: const TextStyle(
                        color: Color(kValueColor),
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      " cm",
                      style: TextStyle(
                        color: Color(kTextGray),
                        fontSize: 25.0,
                      ),
                    )
                  ],
                ),
                Slider(
                  value: _heightValue,
                  // divisions: 120,
                  min: 100,
                  max: 220,
                  activeColor: const Color(kMainOrange),
                  inactiveColor: const Color(kTextGray),
                  onChanged: (value) {
                    setState(() {
                      _heightValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(kLightGray),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Weight",
                      style: TextStyle(
                        color: Color(kTextGray),
                        fontSize: 25.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _weightValue.round().toString(),
                          style: const TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            color: Color(kValueColor),
                          ),
                        ),
                        const Text(
                          " kg",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(kTextGray),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(kTextGray),
                          radius: 20.0,
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Color(kMainOrange),
                            ),
                            onPressed: () {
                              setState(() {
                                _weightValue--;
                              });
                            },
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: const Color(kTextGray),
                          radius: 20.0,
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Color(kMainOrange),
                            ),
                            onPressed: () {
                              setState(() {
                                _weightValue++;
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(kLightGray),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Age",
                      style: TextStyle(
                        color: Color(kTextGray),
                        fontSize: 25.0,
                      ),
                    ),
                    Text(
                      _ageValue.round().toString(),
                      style: const TextStyle(
                        fontSize: 35.0,
                        color: Color(kValueColor),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(kTextGray),
                          radius: 20.0,
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Color(kMainOrange),
                            ),
                            onPressed: () {
                              setState(() {
                                _ageValue--;
                              });
                            },
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: const Color(kTextGray),
                          radius: 20.0,
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Color(kMainOrange),
                            ),
                            onPressed: () {
                              setState(() {
                                _ageValue++;
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 350.0,
            height: 75.0,
            child: ElevatedButton(
              onPressed: () {
                result = _weightValue / pow(_heightValue * 0.01, 2);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => ResultScreen(
                        gender: gender(selectedGender),
                        age: _ageValue,
                        height: _heightValue,
                        weight: _weightValue,
                        result: result,
                        description: description(result)),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(kMainOrange),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text(
                "Calculate your BMI",
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

  String description(double result) {
    String msg = "";
    if (result > 25.0) {
      msg = "Overweight";
    } else if (result < 18.6) {
      msg = "Underweight";
    } else {
      msg = "Normal";
    }

    return msg;
  }

  String gender(Gender selectedGender) {
    String res = "";
    if (selectedGender == Gender.male) {
      res = "Male";
    } else if (selectedGender == Gender.female) {
      res = "Female";
    }

    return res;
  }

  Color genderColorPicker(Gender selectedGender, Gender gender,
      int inactiveColor, int activeColor) {
    late Color color;

    if (selectedGender == gender) {
      color = Color(activeColor);
    } else {
      color = Color(inactiveColor);
    }

    return color;
  }
}
