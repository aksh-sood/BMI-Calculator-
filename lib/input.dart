import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'custom_button.dart';
import 'BMI_calculation.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genders selectedgender;
  int height = 180;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPink,
        shadowColor: Colors.white54,
        elevation: 7,
        title: Text('BMI CALCULATOR',
          style: TextStyle(
            shadows: [ Shadow(color: Color(0xFF0A0E21), blurRadius: 23, offset: Offset(-7, 7))] ,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedgender = Genders.male;
                      });
                    },
                    colour: selectedgender == Genders.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderSelect(
                        gender: "MALE", show: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedgender = Genders.female;
                      });
                    },
                    colour: selectedgender == Genders.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderSelect(
                        gender: "FEMALE", show: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kHeightValueTextStyle,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 110,
                      max: 220,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              weight.toString(),
                              style: kHeightValueTextStyle,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "kg",
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomElevation(
                              color: Colors.pink.withOpacity(0.14),
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CustomElevation(
                              color: Colors.pink.withOpacity(0.14),
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              age.toString(),
                              style: kHeightValueTextStyle,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "years",
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomElevation(
                              color: Colors.pink.withOpacity(0.14),
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CustomElevation(
                              color: Colors.pink.withOpacity(0.14),
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculator cal = Calculator(height: height,weight: weight);
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=>ResultsPage(bmiResult: cal.calciBMI(), comments: cal.comments(), resultText: cal.result()),),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xFFEB1555),
                borderRadius:
                    BorderRadius.vertical(top: Radius.elliptical(38, 30)),
              ),
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                    shadows: [ Shadow(color: Color(0xFF0A0E21), blurRadius: 15, offset: Offset(-7, 7))] ,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
