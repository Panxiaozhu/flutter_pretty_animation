import 'package:example/home_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pretty_animation/animation_bottom_navigation_widget.dart';
import 'package:rive/rive.dart';

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
  Artboard _riveArtboard;

  int currentIndex=0;
  final pages = [Text('122'), Text('23232'), Text('343434'),Text('3434')];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    rootBundle.load("images/dialog.riv").then((value) async {
      final file = RiveFile.import(value);
      final artboard = file.mainArtboard;
      artboard.addController(SimpleAnimation('unselect'));
      setState(() => _riveArtboard = artboard);
    });

    Future.delayed(Duration(milliseconds: 2000),(){
        _riveArtboard.addController(SimpleAnimation('load'));
    });

  }

  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
        if(index==0){
          _riveArtboard.addController(SimpleAnimation('select'));
        }else{
          _riveArtboard.addController( SimpleAnimation('unselect'));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int n=0;
    n|=0x80;
    print(n);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

       // CustomBottomNavigationBar(
       //    items: bottomNavItems,
       //     currentIndex: currentIndex,
       //     selectedLabelStyle: new TextStyle(
       //        fontSize: 18,
       //       color: Colors.blueAccent
       //     ),
       //     unselectedLabelStyle: new TextStyle(
       //         fontSize: 18,
       //         color: Colors.grey
       //     ),
       //     unselectedIconTheme: new IconThemeData(
       //        size: 30,
       //        color: Colors.grey
       //     ),
       //     selectedIconTheme: new IconThemeData(
       //         size: 30,
       //         color: Colors.blueAccent
       //     ),
       //     onTap: (index) {
       //       _changePage(index);
       //     },
       //
       // ),
       body:Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [

           Container(
               width: 220,
               height: 220,
               child: _riveArtboard == null ?  Container(color: Colors.blue,) : Rive(artboard:_riveArtboard, alignment:Alignment.center, fit:BoxFit.contain, )
           ),
         
          MaterialButton(
            onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return HomeRivePage();
                }));
            },
            child: Text('see rive tab'),
          )             
             
         ],)
         ,)
       //pages[currentIndex]
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

       // MultipleFabWidget([
       //   FloatingActionButton(
       //       onPressed: () => print("FloatingActionButton"),
       //       child: IconButton(icon: Icon(Icons.format_color_reset_rounded), onPressed: () {}),
       //       foregroundColor: Colors.white,
       //       backgroundColor: Colors.blue,
       //       shape: CircleBorder()),
       //
       //   FloatingActionButton(
       //       onPressed: () => print("FloatingActionButton"),
       //       child: IconButton(icon: Icon(Icons.save_sharp,size: 20,), onPressed: () {}),
       //       foregroundColor: Colors.white,
       //       backgroundColor: Colors.indigo,
       //       shape: CircleBorder()),
       //
       //   FloatingActionButton(
       //       onPressed: () => print("FloatingActionButton"),
       //       child: IconButton(icon: Icon(Icons.style), onPressed: () {}),
       //       foregroundColor: Colors.white,
       //       backgroundColor: Colors.red,
       //       shape: CircleBorder()),
       // ]
       // )

       //AnimationDiscreteWidget(Icons.ac_unit_outlined,width: 400,height: 650,)

    );
  }
}
