part of flutter_pretty_animation;

class AnimationGroupWidget extends StatefulWidget {

  final List<Widget> childView;
  AnimationGroupWidget(this.childView,{this.milliseconds=1200,this.cubic=Curves.easeOutCubic,this.childWidth=50,this.childHeight=50});
  final int milliseconds;
  final Cubic cubic;
  final double childWidth;
  final double childHeight;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnimationGroupWidgetState();
  }
}

class AnimationGroupWidgetState extends State<AnimationGroupWidget> with TickerProviderStateMixin  {

  GlobalKey anchorKey = GlobalKey();
 late AnimationController logoController;
  late Animation<double> animationLogo;

  late AnimationController titleController;
  late Animation<double> animationTitle;

  Random randomx=new Random();
  Random randomy=new Random();

  //初始化的位置
  List<double> bx=[];
  List<double> by=[];

  //最终固定的位置
  List<double> lx=[];
  List<double> ly=[];

  //变动的位置
  List<double> dx=[];
  List<double> dy=[];
  late double screenWidth;
  late double screenHeight;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      initData();
    });

    titleController = AnimationController(vsync: this, duration: Duration(milliseconds:widget.milliseconds));
    animationTitle=new CurvedAnimation(parent: titleController,curve: widget.cubic);
    titleController.forward();

  }

  void initData(){
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight= MediaQuery.of(context).size.height;

    double startX=(screenWidth-widget.childView.length*widget.childWidth)/2;
    double startY=(screenHeight-widget.childHeight)/2;

    int i=0;
    bx.clear();
    by.clear();
    lx.clear();
    ly.clear();
    dx.clear();
    dy.clear();
    widget.childView.forEach((element) {

      bx.add(randomx.nextInt(screenWidth.toInt()).toDouble());
      by.add(randomy.nextInt(screenHeight.toInt()).toDouble());

      if(i==0){
        lx.add(startX);
        ly.add(startY);
      }else{
        lx.add(startX+widget.childWidth*i);
        ly.add(startY);
      }

      dx.add(0);
      dy.add(0);
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.white.withAlpha(0),
      body: AnimatedBuilder(
          animation: animationTitle,
          builder: (BuildContext context, Widget ?child) {
            return bx.length!=0?Stack(
              children: widget.childView.asMap().keys.map((i) => Positioned(
                  left: getXLocation(i),
                  top: getYLocation(i),

                  child:Container(
                     width: widget.childWidth,
                     height: widget.childHeight,
                     child: Center(
                        child: widget.childView[i],
                     ),
                  )
              )).toList(),
            ):SizedBox();
          }),
    );
  }

  double getXLocation(int i) {

    double value;

    if (bx[i] > lx[i]) {
      value=1-(animationTitle.value == 0? 0.001: animationTitle.value);
      dx[i] = lx[i] + (bx[i] - lx[i]) * value;
    } else {
      value=(animationTitle.value == 0? 0.001: animationTitle.value);
      dx[i] = bx[i] + (lx[i] - bx[i]) * value;
    }

    return dx[i];
  }

  double getYLocation(int i) {

    double value;

    if (by[i] > ly[i]) {
      value=1-(animationTitle.value == 0? 0.000001: animationTitle.value);
      dy[i] = ly[i] + (by[i] - ly[i]) * value;
    } else {
      value=(animationTitle.value == 0? 0.000001: animationTitle.value);
      dy[i] = by[i] + (ly[i] - by[i]) * value;
    }
    return dy[i];
  }

  double getOpacity(double start, double end) {
            print(animationLogo.value);
            if (animationLogo.value >= start && animationLogo.value <= end) {
              return animationLogo.value- start;
            } else if (animationLogo.value < start) {
              return 0.0;
            } else {
              return 1.0;
            }
    }

  @override
  void dispose() {
    // TODO: implement dispose
    logoController.dispose();
    super.dispose();
  }
}