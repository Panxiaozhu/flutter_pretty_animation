import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pretty_animation/animation_bottom_navigation_widget.dart';

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

  int currentIndex=0;
  final pages = [Text('122'), Text('23232'), Text('343434'),Text('3434')];

  final List<BottomNavigationBarItem> bottomNavItems = [

    BottomNavigationBarItem(
      icon: Icon(Icons.school),
      label: "首页",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      label: "信息",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: "购物车",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "我的",
    ),

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void random(){

  }
  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
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
       bottomNavigationBar: CustomBottomNavigationBar(
          items: bottomNavItems,
           currentIndex: currentIndex,
           selectedLabelStyle: new TextStyle(
              fontSize: 18,
             color: Colors.blueAccent
           ),
           unselectedLabelStyle: new TextStyle(
               fontSize: 18,
               color: Colors.grey
           ),
           unselectedIconTheme: new IconThemeData(
              size: 30,
              color: Colors.grey
           ),
           selectedIconTheme: new IconThemeData(
               size: 30,
               color: Colors.blueAccent
           ),
           onTap: (index) {
             _changePage(index);
           },

       ),
       body:pages[currentIndex]
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
