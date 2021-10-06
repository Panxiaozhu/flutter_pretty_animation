import 'dart:ui';
import 'package:flutter/material.dart';

class PrettyElevatedButton extends StatefulWidget {

  PrettyElevatedButton({required this.label, required this.icon,required this.onPressed, required this.processControler, this.onLongPress,
    this.style,
    this.focusNode,
    this.autofocus,
    this.clipBehavior,});

   Widget label;
  final Widget icon;
  final ProcessControler processControler;
  Function onPressed;
  VoidCallback? onLongPress;
  ButtonStyle? style;
  FocusNode? focusNode;
  bool? autofocus;
  Clip? clipBehavior;


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PrettyElevatedButtonState();
  }
}

class _PrettyElevatedButtonState extends State<PrettyElevatedButton> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _failController;
  late Animation _animation;
  List<Widget> originalLabel=[];
  _PrettyElevatedButtonState();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(originalLabel.length==0){
       originalLabel.add(widget.label);
    }
    _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 600));
    _failController = AnimationController(duration: Duration(milliseconds: 1000),vsync: this);
    _animation = CurvedAnimation(parent: _failController,curve: Curves.elasticOut,);
    widget.processControler.addControler(_controller,_failController);
    _failController.addStatusListener((status) {
        if(status==AnimationStatus.completed){
          Future.delayed(Duration(milliseconds: 200), () {
            widget.processControler._process = Process.Normal;
            widget.label=originalLabel[0];
            setState(() {

            });
          });
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: getStyle(),
        onLongPress: widget.onLongPress,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,

        onPressed: () {
          if(_controller.status!=AnimationStatus.forward&&_failController.status!=AnimationStatus.forward){
            print('onPress');
            widget.onPressed();
            setState(() {});
          }
        },
        icon: getIcon(),
        label: widget.label);
  }

  ButtonStyle? getStyle() {

    if (widget.processControler._process == Process.Fail){
      return ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(150, 45)),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return Colors.red;
        }),
      );
    }else{
      return widget.style;
    }

  }

  Widget getIcon() {
    if (widget.processControler._process == Process.Load ||
        widget.processControler._process == Process.Success) {
      return RotationTransition(
        turns: _controller,
        child: widget.processControler._process != Process.Success
            ? widget.icon
            : Icon(Icons.check),
      );
    } else if (widget.processControler._process == Process.Fail) {
      return AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return Icon(
              Icons.clear,
              size: _animation.value * 25,
            );
          });
    } else {
      return SizedBox();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    if (_controller != null) {
      _controller.dispose();
    }

    if (_failController != null) {
      _failController.dispose();
    }

  }
}

class ProcessControler {
  Process _process = Process.Normal;
  late AnimationController _controller;
  late AnimationController _failController;
  late BuildContext context;

  setNormal() {
    _process = Process.Normal;
    if(_controller!=null){
        _controller.reset();
    }
  }

  setLoad() {
    _process = Process.Load;
    if(_controller!=null){
      _controller.repeat();
    }
  }

  setSuccess(){
    _process = Process.Success;
    if(_controller!=null){
      _controller.reset();
    }
  }

  setFail(){
     _process = Process.Fail;
     if(_failController!=null){
       _failController.reset();
       _controller.reset();
       _failController.forward();
     }

  }

  addControler(AnimationController controller,AnimationController failController){
      this._controller=controller;
      this._failController=failController;
  }
}

enum Process{
   Normal,
   Load,
   Success,
   Fail
}