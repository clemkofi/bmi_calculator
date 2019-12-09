import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'round_icon_button.dart';

class LowerCardItem extends StatelessWidget {
  final String topText;
  final int metricNumber;
  final String subMetricText;
  final IconData firstButtonIcon;
  final IconData secondButtonIcon;
  final Function firstButtonIconFunction;
  final Function secondButtonIconFunction;

  LowerCardItem(
      {this.topText,
      this.metricNumber,
      this.subMetricText,
      this.firstButtonIcon,
      this.firstButtonIconFunction,
      this.secondButtonIcon,
      this.secondButtonIconFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(topText, style: kLabelTextStyle,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              metricNumber.toString(),
              style: kNumberTextStyle,
            ),
            Text(
              subMetricText,
              style: kLabelTextStyle,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: firstButtonIcon,
              onPressed: firstButtonIconFunction,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              icon: secondButtonIcon,
              onPressed: secondButtonIconFunction,
            ),
          ],
        )
      ],
    );
  }
}
