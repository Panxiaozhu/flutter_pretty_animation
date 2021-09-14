import 'package:flutter/material.dart';

class RiveBottomTab extends StatefulWidget {
  List<Widget> children;
  Widget floatWidget;
  Widget floatText;
  double centerRadius;
  var tabSelect;

  RiveBottomTab(this.children, this.floatWidget, this.floatText,{this.tabSelect, this.centerRadius = 40});

  @override
  _RiveBottomTabState createState() => _RiveBottomTabState();
}

class _RiveBottomTabState extends State<RiveBottomTab> {
  late double childWidth;
  late double span=10; //外圆的间距
  late double centerOutRadius;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    centerOutRadius = widget.centerRadius + span;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    childWidth = (size.width - centerOutRadius * 2) / 4;

    return CustomPaint(
        painter: BottomPaint(context, widget.centerRadius, centerOutRadius),
        size: new Size(double.infinity, double.infinity),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, span, 0, span),
          child:Row(
            children: [
              new GestureDetector(
                onTap: () {
                  widget.tabSelect(0);
                },
                child: Container(
                  width: childWidth,
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(0, span, 0, 0),
                  child: widget.children[0],
                ),
              ),
              new GestureDetector(
                onTap: () {
                  widget.tabSelect(1);
                },
                child: Container(
                  width: childWidth,
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(0, span, 0, 0),
                  child: widget.children[1],
                ),
              ),
              new GestureDetector(
                  onTap: () {
                    widget.tabSelect(2);
                  },
                  child: Container(
                    width: centerOutRadius * 2,
                    child: Column(
                      children: [
                        widget.floatWidget,
                        SizedBox(
                          height: 2,
                        ),
                        widget.floatText
                      ],
                    ),
                  )),
              new GestureDetector(
                onTap: () {
                  widget.tabSelect(3);
                },
                child: Container(
                  width: childWidth,
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(0, span, 0, 0),
                  child: widget.children[2],
                ),
              ),
              new GestureDetector(
                onTap: () {
                  widget.tabSelect(4);
                },
                child: Container(
                  width: childWidth,
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(0, span, 0, 0),
                  child: widget.children[3],
                ),
              ),
            ],
          ),)


    );
  }
}

class BottomPaint extends CustomPainter {
  BuildContext context;
  double radius; //半径
  double centerOutRadius;
  double span = 10; //外环间距

  BottomPaint(this.context, this.radius, this.centerOutRadius);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    var path = new Path();
    Paint paint = new Paint();
    paint.strokeWidth = 2;
    paint.color = new Color(0xffffffff);
    double width = size.width;
    double height = size.height;
    double sh = span;
    path.moveTo(0, sh);
    path.lineTo(width / 2 - centerOutRadius + span, sh);
    path.addArc(new Rect.fromCircle(center: new Offset(width / 2, centerOutRadius),radius: centerOutRadius),0,180);
    path.moveTo(width / 2 + centerOutRadius - span, sh);
    path.lineTo(width, sh);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.lineTo(0, sh);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
