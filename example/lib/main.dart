import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pretty_animation/animation_multiple_fab_widget.dart';
import 'package:flutter_pretty_animation/flutter_pretty_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterPretty Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'FlutterPretty Animation'),
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
       MultipleFabWidget([

         FloatingActionButton(
             onPressed: () => print("FloatingActionButton"),
             child: IconButton(icon: Icon(Icons.format_color_reset_rounded), onPressed: () {}),
             foregroundColor: Colors.white,
             backgroundColor: Colors.blue,
             shape: CircleBorder()),

         FloatingActionButton(
             onPressed: () => print("FloatingActionButton"),
             child: IconButton(icon: Icon(Icons.save_sharp,size: 20,), onPressed: () {}),
             foregroundColor: Colors.white,
             backgroundColor: Colors.indigo,
             shape: CircleBorder()),

         FloatingActionButton(
             onPressed: () => print("FloatingActionButton"),
             child: IconButton(icon: Icon(Icons.style), onPressed: () {}),
             foregroundColor: Colors.white,
             backgroundColor: Colors.red,
             shape: CircleBorder()),
       ]
       )

       //AnimationDiscreteWidget(Icons.ac_unit_outlined,width: 400,height: 650,)

    );
  }
}
