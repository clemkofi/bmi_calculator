import 'package:flutter/material.dart';
import 'dart:math';
import 'package:bmi_calculator/constants.dart';

class BMICalculatorBrain{
  // properties
  final int height;
  final int weight;
  final int age;

  double _bmi;
  String _bmiResult;
  String _interpretation;
  TextStyle _bmiResultStyle;

  BMICalculatorBrain({@required this.height, @required this.weight, @required this.age}){
    // calculate the bmi for the individual
    _bmi = weight / pow((height/100), 2);
    age <= 20 ? calculateBMITeensAndChildren() : calculateBMI();
  }

  // Methods
  // bmi calculation for adults
  void calculateBMI(){
    if(_bmi >= 25.0){
      _interpretation = "Your body weight is higher than normal. Try to exercise some more!";
      _bmiResult = "Overweight";
      _bmiResultStyle = kResultOverweightTextStyle;
    } else if(_bmi > 18.5 && _bmi < 25.0){
      _interpretation = "Your body weight is normal. Great!";
      _bmiResult = "Normal";
      _bmiResultStyle = kResultNormalTextStyle;
    } else {
      _interpretation = "Your body weight is lower than normal. Please take in some more protein!";
      _bmiResult = "Underweight";
      _bmiResultStyle = kResultUnderweightTextStyle;
    }
  }

  // bmi calculation for children and teens (i.e between the age of 2 and 20)
  void calculateBMITeensAndChildren(){
    // calculate the standard bmi for that age - the 5th percentile and the 85th percentile
    double perc_5 = ((-6.9 * pow(10, -5)) * pow(age, 4)) + (0.0014 * pow(age, 3)) + (0.04 * pow(age, 2)) - (0.63 * age) + 16;
    double perc_85 = (0.00028 * pow(age, 4)) - (0.016 * pow(age, 3)) + (0.34 * pow(age, 2)) - (2.3 * age) + 22;

    if(_bmi >= perc_85){
      _interpretation = "Your body weight is higher than the 85th percentile. Try to exercise some more!";
      _bmiResult = "Overweight";
      _bmiResultStyle = kResultOverweightTextStyle;
    } else if(_bmi > perc_5 && _bmi < perc_85){
      _interpretation = "Your body weight is normal. Great!";
      _bmiResult = "Normal";
      _bmiResultStyle = kResultNormalTextStyle;
    } else {
      _interpretation = "Your body weight is lower than the 5th percentile. Please take in some more protein!";
      _bmiResult = "Underweight";
      _bmiResultStyle = kResultUnderweightTextStyle;
    }

  }

  String getBMI(){
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    return _bmiResult;
  }

  String getInterpretation(){
    return _interpretation;
  }

  TextStyle getResultStyle(){
    return _bmiResultStyle;
  }
}