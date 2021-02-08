import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconContent.dart';
import 'boxContent.dart';
import 'brain.dart';

const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  Gender selectedGender;

  int height = 120;
  int weight = 30;
  int age = 12;

  // void updateColor(Gender selectedGender) {
  //   // Male card pressed

  //   if (selectedGender == Gender.male) {
  //     if (maleCardColour == inactiveCardColour) {
  //       maleCardColour = activeCardColour;
  //       femaleCardColour = inactiveCardColour;
  //     } else {
  //       maleCardColour = inactiveCardColour;
  //     }
  //   }
  //   if (selectedGender == Gender.female) {
  //     if (femaleCardColour == inactiveCardColour) {
  //       maleCardColour = inactiveCardColour;
  //       femaleCardColour = activeCardColour;
  //     } else {
  //       femaleCardColour = inactiveCardColour;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(children: [
                repeatCode(
                    colour: selectedGender == Gender.male
                        ? activeCardColour
                        : inactiveCardColour,
                    codeWidget: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: repeatGender(
                          gender: 'MALE', icon: FontAwesomeIcons.mars),
                    )),
                repeatCode(
                    colour: selectedGender == Gender.female
                        ? activeCardColour
                        : inactiveCardColour,
                    codeWidget: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: repeatGender(
                          gender: 'FEMALE', icon: FontAwesomeIcons.venus),
                    ))
              ]),
            ),
            repeatCode(
              colour: Color(0xFF1D1E33),
              codeWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: labelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: fontTextStyle),
                      Text('cm', style: labelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTickMarkColor: Color(0xFF8D8E98),
                        activeTickMarkColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      // activeColor: Color(0xFFEB1555),
                      // inactiveColor: Color(0xFF8D8E98),
                      min: 120.0,
                      max: 220.0,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  repeatCode(
                      colour: Color(0xFF1D1E33),
                      codeWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', style: labelTextStyle),
                            Text(weight.toString(), style: fontTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  task: () {
                                    setState(() {
                                      weight = weight - 1;
                                    });
                                  },
                                ),
                                SizedBox(width: 10.0),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    task: () {
                                      setState(() {
                                        weight = weight + 1;
                                      });
                                    })
                              ],
                            )
                          ])),
                  repeatCode(
                      colour: Color(0xFF1D1E33),
                      codeWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE', style: labelTextStyle),
                            Text(age.toString(), style: fontTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  task: () {
                                    setState(() {
                                      age = age - 1;
                                    });
                                  },
                                ),
                                SizedBox(width: 10.0),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    task: () {
                                      setState(() {
                                        age = age + 1;
                                      });
                                    })
                              ],
                            )
                          ])),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return resultPage();
                }));
              },
              child: GestureDetector(
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return resultPage(
                      bmiResult: calc.calculateBMI(),
                      intrepretation: calc.getInterpretation(),
                      resultText: calc.getResult(),
                    );
                  }));
                },
                child: Container(
                  child: Center(
                      child: Text('CALCULATE',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold))),
                  color: kBottomContainerColor,
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: kBottomContainerHeight,
                  padding: EdgeInsets.only(bottom: 20.0),
                ),
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.task});
  IconData icon;
  Function task;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      onPressed: task,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
