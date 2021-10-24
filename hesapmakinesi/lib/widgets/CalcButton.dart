import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final Function callback;
  final double textSize;
  const CalcButton({
      Key, key,
      required this.callback,
      required this.fillColor,
      required this.text,
      this.textSize = 24,
      this.textColor = 0xFFFFFFFF,
      })
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        height: 65,
        width: 65,
        child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Text(
            text,
            style: GoogleFonts.rubik(textStyle: TextStyle(fontSize:textSize)),
          ),
          onPressed: () {
            callback(text);
          },
          color: fillColor != null ? Color(fillColor) : null,
          textColor: Color(textColor),
        ),
      ),
    );
  }
}
