import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/CalcButton.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
CalcApp({Key ,key}):super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}






class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression ='';

  void numClick(String text){
    setState(() {
      _expression += text;
    });
  }

void allClear(String text){
    setState(() {
      _history ='';
      _expression ='';
    });
  }

void clear(String text){
    setState(() {
      _expression ='';
    });
  }

void evaluate(String text){
    Parser p = Parser();
  Expression exp = p.parse(_expression);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  setState(() {
    _history = _expression;
    _expression = eval.toString();
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hesap Makinesi',
      home:Scaffold(
        backgroundColor: Colors.black,
        body:Column( 
          mainAxisAlignment: MainAxisAlignment.end,
        children :<Widget>[
          Container(
            padding: EdgeInsets.only(right: 12),
            child: Text(_history
            ,style: GoogleFonts.rubik(
              textStyle:TextStyle(
                color: Color(0xFF545F61),
                fontSize:24
              )
            ),),
            alignment: Alignment(1,1),
          ),

           Container(
            padding: EdgeInsets.all(12),
            child: Text(_expression
            ,style: GoogleFonts.rubik(
              textStyle:TextStyle(
                color: Colors.white,
                fontSize:48
              )
            ),),
            alignment: Alignment(1,1),
          ),
          SizedBox(height:40),
          Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
         CalcButton(
           callback: allClear,
           text:"AC",
           fillColor: 0xFFAAAAAA,
           textColor: 0XFF030000,
           ),

         CalcButton(
           text:"C",
           
          callback: clear,
           fillColor:0xFFAAAAAA,
           textColor: 0xFF030000,
           ),

         CalcButton(
           text:"%",
            callback: numClick,
           fillColor: 0xFFAAAAAA,
           textColor: 0xFF030000,
           ),
           CalcButton(
           text:"/",
            callback: numClick,
           fillColor:0xFFFFCC00,
           textColor: 0xFF65BDAC,
           ),
          ],
        ),

        Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
         CalcButton(
           text:"7",
            callback: numClick,
           fillColor: 0xFF242424,
           ),

         CalcButton(
           text:"8",
            callback: numClick,
           fillColor:0xFF242424 ,
           textColor: 0xFFFFFFFF,
           ),

         CalcButton(
           text:"9",
            callback: numClick,
           fillColor: 0xFF242424,
           textColor: 0xFFFFFFFF,
           ),
           CalcButton(
           text:"*",
            callback: numClick,
           fillColor: 0XFFFFA000,
           textColor: 0xFFFFFFFF,
           ),
          ],
        ),

         Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
         CalcButton(
           text:"4",
            callback: numClick,
           fillColor: 0xFF242424,
           textColor: 0xFFFFFFFF,
           ),

         CalcButton(
           text:"5",
            callback: numClick,
           fillColor:0xFF242424 ,
           textColor: 0xFFFFFFFF,
           ),

         CalcButton(
           text:"6",
            callback: numClick,
           fillColor: 0xFF242424,
           textColor: 0xFFFFFFFF,
           ),
           CalcButton(
           text:"-",
            callback: numClick,
           fillColor: 0XFFFFA000,
           textColor: 0xFFFFFFFFF,
           ),
          ],
        ),

         Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
         CalcButton(
           text:"1",
            callback: numClick,
           fillColor: 0xFF242424,
           textColor: 0xFFFFFFFF,
           ),

         CalcButton(
           text:"2",
            callback: numClick,
           fillColor:0xFF242424 ,
           textColor: 0xFFFFFFFF
           ),

         CalcButton(
           text:"3",
            callback: numClick,
           fillColor: 0xFF242424,
           textColor: 0xFFFFFFFF,
           ),
           CalcButton(
           text:"+",
            callback: numClick,
           fillColor: 0XFFFFA000,
           textColor: 0xFFFFFFFF,
           ),
          ],
        ),

         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
         CalcButton(
           text:"0",
            callback: numClick,
           fillColor: 0xFF242424,
           textColor: 0XFFFFFFFF,
           ),

         CalcButton(
           text:"00",
            callback: numClick,
           fillColor:0xFF242424 ,
           textColor: 0XFFFFFFFF,
           ),

         CalcButton(
           text:",",
            callback: numClick,
           fillColor: 0xFF242424,
           textColor: 0xFFFFFFFF,
           ),
           CalcButton(
           text:"=",
            callback: evaluate,
           fillColor: 0XFFFFA000,
           textColor: 0xFFFFFFFF,
           ),
          ],
        ),
        ]
        ),
      )
    );
  }
}

