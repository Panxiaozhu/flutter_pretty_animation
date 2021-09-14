import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pretty_animation/rive_bottom_tab.dart';
import 'package:rive/rive.dart';

class HomeRivePage extends StatefulWidget {

  HomeRivePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeRivePageState();
  }

}

class _HomeRivePageState extends State<HomeRivePage> {

  int _currentIndex = 0;
  List<Widget> _pages = [];
  PageController _controller= PageController(initialPage: 0);
  DateTime _lastPressedTime;
  List<Widget> tabList=[];
  Widget centerWidget;

  Artboard _riveArtboard;

  Artboard _riveArtboard1;

  Artboard _riveArtboard2;

  Artboard _riveArtboard3;

  Artboard _riveArtboard4;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initView();
    // rootBundle.load("images/dialog.riv").then((value) async {
    //   final file = RiveFile.import(value);
    //   final artboard = file.mainArtboard;
    //   artboard.addController(SimpleAnimation('unselect'));
    //   setState(() => _riveArtboard = artboard);
    // });

    rootBundle.load("/images/building.riv").then((value) async {
      final artboard = RiveFile.import(value).mainArtboard;
      artboard.addController(SimpleAnimation('select'));
      _riveArtboard = artboard;
      setState((){
      });
    });

    rootBundle.load("/images/open.riv").then((value) async {
      final artboard = RiveFile.import(value).mainArtboard;
      artboard.addController(SimpleAnimation('unSelect'));
      _riveArtboard1 = artboard;
      setState((){

      });

    });

    rootBundle.load("/images/dev.riv").then((value) async {
      final artboard = RiveFile.import(value).mainArtboard;
      artboard.addController(SimpleAnimation('unSelect'));
      _riveArtboard2 = artboard;
      setState((){
      });
    });

    rootBundle.load("/images/person.riv").then((value) async {
      final artboard = RiveFile.import(value).mainArtboard;
      artboard.addController(SimpleAnimation('unSelect'));
      _riveArtboard3 = artboard;
      setState((){

      });

    });

    rootBundle.load("/images/table.riv").then((value) async {
      final artboard = RiveFile.import(value).mainArtboard;
      artboard.addController(SimpleAnimation('select'));
      _riveArtboard4 = artboard;
      setState((){

      });

    });
  }

  initTabList(){

    if(_riveArtboard!=null&&_riveArtboard1!=null&&_riveArtboard2!=null&&_riveArtboard3!=null){
      print('执行');
      tabList = [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _riveArtboard == null
                ? Container(
              width: 1,
              height: 1,
              color: Colors.white,
            )
                : Container(
              width: 30,
              height: 30,
              child: Rive(
                artboard: _riveArtboard,
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              '首页',
              style: new TextStyle(fontSize: 14),
            )
          ],
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _riveArtboard1 == null
                ? Container(
              width: 1,
              height: 1,
              color: Colors.white,
            )
                : Container(
              width: 30,
              height: 30,
              child: Rive(
                artboard: _riveArtboard1,
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              '会员',
              style: new TextStyle(fontSize:14),
            )
          ],
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _riveArtboard2 == null
                ? Container(
              width: 1,
              height: 1,
              color: Colors.white,
            )
                : Container(
              width: 30,
              height: 30,
              child: Rive(
                artboard: _riveArtboard2,
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              '设备',
              style: new TextStyle(fontSize: 14),
            )
          ],
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _riveArtboard3 == null
                ? Container(
              width: 1,
              height: 1,
              color: Colors.white,
            )
                : Container(
              width: 30,
              height: 30,
              child: Rive(
                artboard: _riveArtboard3,
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              '我的',
              style: new TextStyle(fontSize: 14),
            )
          ],
        ),
      ];

      centerWidget=Column(
        children: [
          _riveArtboard4 == null
              ? Container(
            width: 1,
            height: 1,
            color: Colors.white,
          )
              : Container(
            width: 50,
            height: 50,
            child: Rive(
              artboard: _riveArtboard4,
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
          )
        ],
      );

    }

  }

  @override
  Widget build(BuildContext context) {
    initTabList();
    // TODO: implement build
    return  WillPopScope(
        onWillPop: () async {
          if (_lastPressedTime == null ||
              DateTime.now().difference(_lastPressedTime) >
                  Duration(seconds: 2)) {
            _lastPressedTime = DateTime.now();
            return false;
          } else {
            _lastPressedTime = DateTime.now();
            // 退出app
            await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            return true;
          }
        },
       child:Scaffold(
          appBar: AppBar(
            title: Text('rive_bottom'),
          ),
         body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom:0,
              child:  PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                //viewPage禁止左右滑动
                onPageChanged: _pageChange,
                controller: _controller,
                itemCount: _pages.length,
                itemBuilder: (context, index) => _pages[index]),),

            tabList.length==0?SizedBox(
            ): Positioned(
               bottom: 0,
               left: 0,
               right: 0,
               child:RiveBottomTab(tabList,centerWidget,Text('课程表'),tabSelect: (index){
                onTap(index);
              },))
          ],
        ),
      ),
    );

  }



  void _initView() async {

    _pages = [
      Container(
         width: double.infinity,
        height: double.infinity,
        color: Colors.red,
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.brown,
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.amberAccent,
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
      ),
    ];

    setState(() {});
  }


  void onTap(int index) {
    _controller.jumpToPage(index);
    _riveArtboard.addController(SimpleAnimation('unSelect'));
    _riveArtboard1.addController(SimpleAnimation('unSelect'));
    _riveArtboard2.addController(SimpleAnimation('unSelect'));
    _riveArtboard3.addController(SimpleAnimation('unSelect'));

    switch (index) {
      case 0:
        _riveArtboard.addController(SimpleAnimation('select'));
        break;
      case 1:
        _riveArtboard1.addController(SimpleAnimation('select'));
        break;
      case 3:
        _riveArtboard2.addController(SimpleAnimation('select'));
        break;
      case 4:
        _riveArtboard3.addController(SimpleAnimation('select'));
        break;
    }

    setState(() {

    });
  }


  void _pageChange(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  Widget getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.blue,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}














