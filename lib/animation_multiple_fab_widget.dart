import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class MultipleFabWidget extends StatefulWidget{
   List<Widget> children;
   Widget openWidget;
   double verticalSpace;
   double rightSpace;

   MultipleFabWidget(this.children,
      {this.openWidget = const FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          child: IconButton(
              icon: Icon(
            Icons.add,
            color: Colors.white,
          )),
          shape: CircleBorder()),
      this.verticalSpace = 20,
      this.rightSpace = 10});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return MultipleFabWidgetState(children,openWidget: openWidget,verticalSpace: verticalSpace,rightSpace: rightSpace);
  }
}

class MultipleFabWidgetState extends State<MultipleFabWidget> with TickerProviderStateMixin {

  List<Widget> children;
  Widget openWidget;
  double verticalSpace;
  double rightSpace;

  AnimationController controller;
  CurvedAnimation  animation;
  List<GlobalKey> keyArray=[];
  List<double> heightArray=[];
  int direction=0;


  MultipleFabWidgetState(this.children,
      {this.openWidget = const FloatingActionButton(

      child: IconButton(
      icon: Icon(
      Icons.add,
      color: Colors.white,
      ))),
      this.verticalSpace = 20,
      this.rightSpace = 10});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    children.add(openWidget);

    controller = AnimationController(duration: Duration(milliseconds: 300), vsync: this); //AnimationController
    animation=CurvedAnimation(parent: controller, curve: Curves.linear);
    controller.addStatusListener((status) {

        if(status==AnimationStatus.completed){
            // print('completed');
            // widget.children.removeAt(widget.children.length-1);
            // widget.children.add(widget.closeWidget);
            // setState(() {
            //
            // });
        }else if(status==AnimationStatus.reverse){
            // print('reverse');
            // widget.children.removeAt(widget.children.length-1);
            // widget.children.add(widget.openWidget);
            // setState(() {
            //
            // });
        }else if(status==AnimationStatus.forward){
            print('forward');
        }
    });
    children.forEach((element) {
      final GlobalKey globalKey=new GlobalKey();
      keyArray.add(globalKey);

    });

    Future.delayed(Duration.zero,(){
      keyArray.forEach((element) {heightArray.add(element.currentContext.size.height);
      print(element.currentContext.size.height.toString());
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: children
          .asMap()
          .keys
          .map((i) =>

          AnimatedBuilder(
            animation: animation,
            builder: (BuildContext ctx, Widget child){
              return Positioned(
                  bottom: countBottomSpace(i),
                  right: widget.rightSpace,
                  child: Opacity(
                    opacity: getOpacity(i),
                    //opacity:1,
                    child: Container(
                    key: keyArray[i],
                    child: getItem(i),
                  ),)
              );
            },
          ),

      ).toList(),
    );
  }

  Widget getItem(int i){
     if(i==keyArray.length-1){
        return new GestureDetector(
            onTap: (){
              if(controller.status==AnimationStatus.completed){
                direction=1;
                controller.reverse();
              }else{
                direction=0;
                controller.forward();
              }

            },
          child:Transform.rotate(
              angle: getAngle(),
          child:  children[i],),
         );
     }else{
       return children[i];
     }
  }

  double getAngle(){
      if(direction==0){
         return math.pi/4*animation.value;
      }else{
        return math.pi/4+math.pi/4*(1-animation.value);
      }
  }

  double getOpacity(int position){
    if(position==keyArray.length-1){
      return 1;
    }
    return animation.value==null?1:animation.value;
  }

  double countBottomSpace(int position){
    if(position==keyArray.length-1||heightArray.length==0){
        return verticalSpace;
    }
    double bottom=0;
    for(int i=position;i<keyArray.length-1;i++){
       bottom=bottom+verticalSpace+(heightArray.length==0?0:heightArray[i+1]);
    }
    return (bottom)*animation.value+verticalSpace;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
   // widget.children.clear();
  }

}