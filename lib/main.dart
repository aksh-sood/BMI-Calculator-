
import 'package:flutter/material.dart';
import 'input.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        sliderTheme:SliderTheme.of(context).copyWith(
            overlayColor: Color(0xFFEB1555),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius:13,),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 24,),
          ),
      ),
      home: InputPage(),
    );
  }
}
