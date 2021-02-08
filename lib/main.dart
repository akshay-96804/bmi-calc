import 'package:flutter/material.dart';
import 'inputPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        // It applies to tabBar,toolBar,appBar etc ;
        primaryColor: Color(0xFF0A0E21),
        // It applies to flotaing action button
        // accentColor: Colors.purple,
        // textTheme: TextTheme(body1: TextStyle(color: Colors.white))
      ),
      home: InputPage(),
    );
  }
}

/*floatingActionButton: Theme(
        data: ThemeData(accentColor: Colors.purple),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),*/
