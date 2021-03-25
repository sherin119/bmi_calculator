import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';


enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = kInactiveCardColor;
  Color femaleColor = kInactiveCardColor;
  int height = 180;
  int weight = 60;
  int age = 19;
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        color: selectedGender == Gender.male
                            ? maleColor = kActiveCardColor
                            : maleColor = kInactiveCardColor,
                        cardChild: IconContent(
                          iconType: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        color: selectedGender == Gender.female
                            ? femaleColor = kActiveCardColor
                            : femaleColor = kInactiveCardColor,
                        cardChild: IconContent(
                          iconType: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kHeightTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            activeColor: Colors.pink,
                            inactiveColor: Colors.grey,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      ],
                    ),
                  ),
                  color: kActiveCardColor,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kHeightTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  child: Icon(FontAwesomeIcons.minus),
                                  onPress: () {
                                    setState(() {
                                      weight = weight - 1;
                                    });
                                  },
                                ),
                                SizedBox(width: 15),
                                RoundIconButton(
                                  onPress: () {
                                    setState(() {
                                      weight = weight + 1;
                                    });
                                  },
                                  child: Icon(FontAwesomeIcons.plus),
                                )
                              ],
                            )
                          ],
                        ),
                        color: kActiveCardColor,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kHeightTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  onPress: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  child: Icon(FontAwesomeIcons.minus),
                                ),
                                SizedBox(width: 15),
                                RoundIconButton(
                                  onPress: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: Icon(FontAwesomeIcons.plus),
                                )
                              ],
                            )
                          ],
                        ),
                        color: kActiveCardColor,
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                onTap: (){
                  CalculatorBrain calc = CalculatorBrain(h:height, w:weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultsPage(
                      getResultBMI: calc.calculateBMI() ,
                      getResultsText: calc.getResult(),
                      getInterpretation: calc.getInterpretation(),

                    )),
                  );
                },
                buttonText: 'CALCULATE',
              )
            ],
          ),
        ),
      ),
    );
  }
}




