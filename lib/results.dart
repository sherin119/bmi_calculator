

import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.getResultBMI, @required this.getResultsText, @required this.getInterpretation});

  final String getResultBMI;
  final String getResultsText;
  final String getInterpretation;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text('Your result',
                    style: kTitleTextStyle),
              ),),
            Expanded(
              flex: 5,
              child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(


                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(getResultsText, style: kResultTextStyle, textAlign: TextAlign.center,),
                  Text(getResultBMI, style: kBmiTextStyle, textAlign: TextAlign.center,),
                  Text(getInterpretation, style: kBodyTextStyle, textAlign: TextAlign.center,),
                ],
              ),
            ),),
            BottomButton(
              onTap: (){Navigator.pop(context);},
              buttonText: 'RE-CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}
