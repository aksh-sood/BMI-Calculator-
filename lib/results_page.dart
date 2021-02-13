import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult,@required this.comments,@required this.resultText});
  final String bmiResult;
  final String resultText;
  final String comments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white54,
        elevation: 7,
        centerTitle: true,
        title: Text('BMI CALCULATOR',
        style: TextStyle(
          shadows: [ Shadow(color: Color(0xFF0A0E21), blurRadius: 23, offset: Offset(-7, 7))] ,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: kPink,
      ),
        body:Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Row(mainAxisAlignment:MainAxisAlignment.start ,
              children: [
                SizedBox(width: 20,),
                Text('Your Result',
                      textAlign: TextAlign.left,
                      style:kTitleTextStyle ,
                  ),
              ],
            ),

            Expanded(
              flex: 30,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(

                    children:[

                      SizedBox(height: 35,),
                      Text(resultText,
                    style: TextStyle(
                      fontSize: 33,
                      color: Colors.greenAccent,
                    ),
                      ),
                      SizedBox(height: 27,),
                      Text('Your BMI is:',
                      style:kTitleTextStyle,
                      ),
                      SizedBox(height: 20,),
                      Row(mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children:[
                      Text(bmiResult,
                        style:kResultStyle,
                      ),
                      SizedBox(width: 5,),
                      Text('kg/m2',
                        style:TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 20,
                        ),
                      ),
                  ]
                      ),
                      SizedBox(height: 30,),
                      Text('Normal BMI range is:',
                        style:kLabelTextStyle,
                      ),
                      SizedBox(height: 16,),
                      Text('18.5 - 25 kg/m2',
                        style:TextStyle(fontSize: 18,

                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(comments,
                      style:TextStyle(fontSize: 20,

                      ),
                      ),
                    ]

                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
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
                    "RE-CALCULATE",
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
