import 'package:bmi_calculator/calculate_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/lowercard_item.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/topcard_item.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender activeGender;
  int height = 170;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            activeGender = Gender.male;
                          });
                        },
                        colour: activeGender == Gender.male
                            ? kActiveCardColour
                            : kInkActiveCardColour,
                        cardChild: TopCardItem(
                          cardIcon: FontAwesomeIcons.mars,
                          cardText: "MALE",
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            activeGender = Gender.female;
                          });
                        },
                        colour: activeGender == Gender.female
                            ? kActiveCardColour
                            : kInkActiveCardColour,
                        cardChild: TopCardItem(
                          cardIcon: FontAwesomeIcons.venus,
                          cardText: "FEMALE",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          " cm",
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.blue,
                          inactiveTrackColor: kDarkGrayInactiveColour,
                          thumbColor: Colors.blue,
                          overlayColor: Color(0x292196F3),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: kMinHeight,
                        max: kMaxHeight,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: LowerCardItem(
                          topText: "WEIGHT",
                          metricNumber: weight,
                          subMetricText: " kg",
                          firstButtonIcon: FontAwesomeIcons.minus,
                          secondButtonIcon: FontAwesomeIcons.plus,
                          firstButtonIconFunction: () {
                            setState(() {
                              weight = weight < kMinWeight + 1
                                  ? kMinWeight
                                  : weight - 1;
                            });
                          },
                          secondButtonIconFunction: () {
                            setState(() {
                              weight = weight > kMaxWeight - 1
                                  ? kMaxWeight
                                  : weight + 1;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: LowerCardItem(
                          topText: "AGE",
                          metricNumber: age,
                          subMetricText: " yrs",
                          firstButtonIcon: FontAwesomeIcons.minus,
                          secondButtonIcon: FontAwesomeIcons.plus,
                          firstButtonIconFunction: () {
                            setState(() {
                              age = age < kMinAge + 1 ? kMinAge : age - 1;
                            });
                          },
                          secondButtonIconFunction: () {
                            setState(() {
                              age = age > kMaxAge - 1 ? kMaxAge : age + 1;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                buttonText: "CALCULATE",
                onTap: () {
                  BMICalculatorBrain bmiCalc = BMICalculatorBrain(weight: weight, height: height, age: age);

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ResultsPage(
                        resultText: bmiCalc.getResult(),
                        resultTextStyle: bmiCalc.getResultStyle(),
                        bmi: bmiCalc.getBMI(),
                        interpretation: bmiCalc.getInterpretation(),
                      );
                    },
                  ));
                },
              ),
            ],
          ),
        ));
  }
}
