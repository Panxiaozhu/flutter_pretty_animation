part of flutter_pretty_animation;

class AnimationlikeWidget extends StatefulWidget{
  double width;
  bool isLike;
  double heartStrokeWidth;

  AnimationlikeWidget({this.width=60,this.isLike=false,this.heartStrokeWidth=2});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnimationlikeWidgetState();
  }

}

class AnimationlikeWidgetState extends State<AnimationlikeWidget> with TickerProviderStateMixin{
  AnimationController controller;
  Animation animation;
  AnimationController likeController;
  CurvedAnimation  likeAnimation;
  bool disLikeEnd=false;
  bool likeEnd=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds:1000), vsync: this); //AnimationController
    animation = ColorTween(begin: Colors.red, end: Colors.white).animate(controller);
    controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        widget.isLike = false;
        controller.reset();
        setState(() {

        });
      }
    });

    likeController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this); //AnimationController
    likeAnimation=CurvedAnimation(parent: likeController, curve: Curves.easeOutCirc);
    likeController.addStatusListener((status) {
       if(status == AnimationStatus.completed){
        widget.isLike = true;
        likeController.reset();
        setState(() {

        });
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: (){
       // controller.forward();
        if(!widget.isLike){
          likeController.reset();
          likeController.forward();
        }else{
          controller.reset();
          controller.forward();
        }


      },
      child: AnimatedBuilder(
        animation: widget.isLike?animation:likeAnimation,
        builder: (BuildContext ctx, Widget child){
          return new CustomPaint(
            size: countWidth(likeAnimation.value, widget.width),
            painter: new AnimationDislikePaint(animation.value,
                center: countWidth(likeAnimation.value, widget.width).width/2,
                isLike:widget.isLike,
                start: likeAnimation.value!=0,
                disLikeEnd: disLikeEnd,
                heartStrokeWidth: widget.heartStrokeWidth),
          );
        },
      ),
    );
  }

  Size countWidth(double value,double width){
      if(value==0){
         return new Size(width,width*4/7);
      }
      double scale;

      if(value<0.5){
        scale=value*10*2/5;
      }else{
        //0.5-0
         if(value>0.8){
           scale=1;
         }else{
           scale=(1-value)*10*2/5;
         }
      }
      return new Size(width*scale,(width*scale)*4/7);
  }

}


class AnimationDislikePaint extends CustomPainter{
  double center;
  Color color;
  //bool isEnd;
  bool start;
  bool isLike;
  bool disLikeEnd;
  bool likeEnd;
  double heartStrokeWidth;
  AnimationDislikePaint(this.color,{this.isLike=false,this.start=false,this.center=30,this.disLikeEnd=false,this.likeEnd=false,this.heartStrokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    // 300/150

    var path=new Path();
    Paint paint=new Paint();

    ///设置画笔的颜色
    if(!isLike){
      if(start){
        paint.color=Colors.red;
      }else{
        paint.color=Colors.grey;
      }
    }else{
      paint.color=Colors.red;
    }

    if(!isLike){
      if(start){
        paint.style=PaintingStyle.fill;
      }else{
        paint.style=PaintingStyle.stroke;
      }
    }else{
      paint.style=PaintingStyle.fill;
    }

    if(likeEnd){
      paint.style=PaintingStyle.fill;
      paint.color=Colors.red;
    }

    if(disLikeEnd){
      paint.style=PaintingStyle.stroke;
      paint.color=Colors.grey;
    }

    paint.strokeWidth=heartStrokeWidth;

    // 宽高 14：8

    double centerX=center;
    double centerY=centerX*15/14;
    path.moveTo(centerX, centerY);

    path.cubicTo(centerX/7, centerY*10/15, centerX*5/7, 0, centerX, centerY*2/5);
    path.cubicTo(centerX*9/7, 0, centerX*13/7, centerY*2/3, centerX, centerY);



    Paint linePaint=new Paint();
    linePaint.strokeWidth=2;
    linePaint.color=this.color;

    canvas.drawPath(path, paint);

    if(isLike&&!disLikeEnd){
      canvas.drawLine(Offset(centerX,centerY), Offset(centerX*160/140,centerY*110/150), linePaint);
      canvas.drawLine(Offset(centerX*160/140,centerY*110/150), Offset(centerX*120/140,centerY*100/150), linePaint);
      canvas.drawLine(Offset(centerX*120/140,centerY*100/150), Offset(centerX*160/140,centerY*80/150), linePaint);
      canvas.drawLine(Offset(centerX*160/140,centerY*80/150), Offset(centerX,centerY*60/150), linePaint);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}