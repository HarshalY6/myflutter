import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstval = 0;
  int secval = 0;
  String output = "";
  String res = "";
  String oper = "";
  void processvalue(String val) {
    if (val == "C") {
      output = "";
      firstval = 0;
      secval = 0;
      output = "";
      res = "";
    } else if (val == "+" || val == "-" || val == "X" || val == "/") {
      firstval = int.parse(output);
      res = "";
      oper = val;
    } else if (val == "=") {
      secval = int.parse(output);
      if (oper == '+') {
        res = (firstval + secval).toString();
      }
      if (oper == '-') {
        res = (firstval - secval).toString();
      }
      if (oper == 'X') {
        res = (firstval * secval).toString();
      }
      if (oper == '/') {
        res = (firstval / secval).toString();
      }
    } else {
      res = int.parse(output + val).toString();
    }
    setState(() {
      output = res;
    });
  }

  Widget NEWBUTTON(String val) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => processvalue(val),
        child: Text(
          "$val",
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(30),
              child: Text(
                "$res",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.blue,
            )),
            Row(
              children: [
                NEWBUTTON("C"),
                NEWBUTTON("0"),
                NEWBUTTON("="),
                NEWBUTTON("+"),
              ],
            ),
            Row(
              children: [
                NEWBUTTON("1"),
                NEWBUTTON("2"),
                NEWBUTTON("3"),
                NEWBUTTON("-"),
              ],
            ),
            Row(
              children: [
                NEWBUTTON("4"),
                NEWBUTTON("5"),
                NEWBUTTON("6"),
                NEWBUTTON("X"),
              ],
            ),
            Row(
              children: [
                NEWBUTTON("7"),
                NEWBUTTON("8"),
                NEWBUTTON("1"),
                NEWBUTTON("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
