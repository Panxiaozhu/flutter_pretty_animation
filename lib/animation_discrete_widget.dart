part of flutter_pretty_animation;

class AnimationDiscreteWidget extends StatefulWidget{
  double width;
  double height;
  int milliseconds;
  IconData child;

  AnimationDiscreteWidget(this.child,{this.width=768, this.height=1024,this.milliseconds=200});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnimationDiscreteWidgetState();
  }

}

class AnimationDiscreteWidgetState extends State<AnimationDiscreteWidget>{
  List<Widget> childs=[];
  var timeout;
  AnimationDiscreteWidgetState();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeout=Duration(milliseconds:widget.milliseconds);

    Timer.periodic(timeout, (timer) {
      //callback function
      if (childs.length > 20) {
        childs.removeAt(0);
      }
      childs.add(AnimationDiscrete(widget.child,key: UniqueKey(),width: widget.width,height: widget.height,));
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
        children: childs,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

}

class AnimationDiscrete extends StatefulWidget{
  double width;
  double height;
  IconData child;
  AnimationDiscrete(this.child,{Key key,this.width, this.height}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnimationDiscreteState();
  }
}

class AnimationDiscreteState extends State<AnimationDiscrete> with TickerProviderStateMixin {
  AnimationController likeController;
  CurvedAnimation  likeAnimation;
  Random colorRandom=new Random();
  Size sizex0;
  Size sizex1;
  Size sizex2;
  Size sizex3;

  List<Color> colorList=[Colors.red,Colors.blue,Colors.grey,Colors.orange,
    Colors.green,Colors.amber,Colors.blueGrey,Colors.brown,Colors.black87,Colors.purple];
  Color color;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    color=colorList[Random().nextInt(10)];

    likeController = AnimationController(duration: Duration(milliseconds: 3000), vsync: this); //AnimationController
    likeAnimation=CurvedAnimation(parent: likeController, curve: Curves.easeOutCirc);
    likeController.forward();
  }

  void init(){
    sizex3=new Size(0,0);
    sizex2=new Size(Random().nextInt(widget.width.toInt()).toDouble(),0);
    sizex1=new Size(Random().nextInt(widget.width.toInt()).toDouble(),widget.height);
    sizex0=new Size(0,widget.height);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: widget.width,
       height: widget.height,
       child: Stack(
         children: [
           AnimatedBuilder(
             animation: likeAnimation,
             builder: (BuildContext ctx, Widget child){
               return new Positioned(
                   left:getX(likeAnimation.value),
                   top:getY(likeAnimation.value),
                   child: Opacity(
                      opacity: 1-likeAnimation.value,
                      child: Icon(widget.child,size: 60,color: color,)
                   )
               );
             },
           ),

         ],
       ),
    );
  }


  double getX(double ss){
    double t=ss;
    return (1-t)*((1-t)*sizex0.width+t*sizex1.width)+t*((1-t)*sizex1.width+t*sizex2.width);
  }

  double getY(double ss){
    double t=ss;
    return (1-t)*((1-t)*sizex0.height+t*sizex1.height)+t*((1-t)*sizex1.height+t*sizex2.height);
  }

   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    likeController.dispose();
   // likeController=null;
   // likeAnimation.c
  }

}