import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class repeatGender extends StatelessWidget {
  repeatGender({this.gender, this.icon});

  String gender;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0),
        SizedBox(height: 15.0),
        Text(gender, style: labelTextStyle)
      ],
    );
  }
}
