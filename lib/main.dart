import 'dart:async';

import 'package:flutter/material.dart';

import 'sheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
Map data={};


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Spreadsheet(
        
         length: 100,
         rowLength: 5,
         titles:['Name','Phone','Sex','Email','website'],
         callback:(val) => data = val,
        headTextStyle:TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // fontFamily: 'cairor',
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50,
                                        color: Colors.black),
       cellTextStyle:TextStyle(
                                        // fontFamily: 'cairor',
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                55,
                                        color: Colors.black),
widthValues: [
  
  MediaQuery.of(context).size.width/5,
  MediaQuery.of(context).size.width/5,
  MediaQuery.of(context).size.width/5,
  MediaQuery.of(context).size.width/5,
  MediaQuery.of(context).size.width/5,


],
suggestions: [

  ['Abanoub','Mina','Magdy','Marcos','Fouad'],
[],
[],
[],
[],
],
        ),
      ),
    );
  }
}
