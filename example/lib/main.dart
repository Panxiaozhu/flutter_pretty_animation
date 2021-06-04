import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pretty_animation/flutter_pretty_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Animation Group'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  void random(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
       body:
      // Center(
      //   child:  AnimationlikeWidget(isLike: false,width: 180,),
      // )

      // AnimationGroupWidget(
      //     [
      //       Icon(Icons.audiotrack,size: 50,),
      //       Icon(Icons.audiotrack),
      //       Icon(Icons.audiotrack),
      //       Icon(Icons.favorite,size: 50,),
      //       Icon(Icons.audiotrack),
      //       Icon(Icons.audiotrack),
      //
      //
      //     ]
      // ),
       AnimationDiscreteWidget(width: 400,height: 650,)

    );
  }
}
