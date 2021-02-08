import 'package:flutter/material.dart';

class repeatCode extends StatelessWidget {
  repeatCode({@required this.colour, this.codeWidget});
  final Color colour;
  final Widget codeWidget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
        child: codeWidget,
      ),
    );
  }
}
