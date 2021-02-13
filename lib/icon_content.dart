import 'package:flutter/material.dart';

class GenderSelect extends StatelessWidget {
  final String gender;
  final IconData show;
  GenderSelect({this.gender,this.show});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          show,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: TextStyle(
            fontSize: 20,
            color: Color(0Xff8D8E98),
          ),
        ),
      ],
    );
  }
}
