# flutter_pretty_animation
漂亮的动画库
[pub](https://pub.dev/packages/flutter_pretty_animation)
## AnimationGroupWidget
传入一个widget数组，横向排序，随机发散收拢

<img src="https://user-images.githubusercontent.com/12110768/122944234-37dc0800-d3aa-11eb-8d39-c95b759a5c0f.gif" width="232" height="426" >

## AnimationlikeWidget
 基于贝塞尔曲线的点赞取消动画啊

 |参数 |说明|
 | -------------|--------------|
 |width| 占用区域宽度，高度自动计算|
 |isLike| 初始化状态，true：已点赞，false：未点赞|
 |heartStrokeWidth|未点赞状态心形的描边宽度 |

<img src="https://user-images.githubusercontent.com/12110768/122944230-37437180-d3aa-11eb-83b0-df99d6ab336f.gif" width="232" height="426" >

## AnimationDiscreteWidget

 |参数 |说明|
 | -------------|--------------|
 |width| 动画区域宽|
 |height| 动画区域高|
 |milliseconds| 动画飞出频率|
 |IconData| 动画icon|

 <img src="https://user-images.githubusercontent.com/12110768/122944447-6b1e9700-d3aa-11eb-86c7-0a3c37671ccb.gif" width="232" height="426" >

 ## MultipleFabWidget

  |参数 |说明|
  | -------------|--------------|
  |children| 展开的按钮集合|
  |openWidget| 控制按钮|
  |verticalSpace| 按钮高间距|
  |rightSpace| 按钮右边距离|

  <img src="https://user-images.githubusercontent.com/12110768/122944217-3579ae00-d3aa-11eb-8976-a1d9497e5d60.gif" width="232" height="426" >

  ## CustomBottomNavigationBar
  修改BottomNavigationBar，自定义选中时动画

   <img src="https://user-images.githubusercontent.com/12110768/130090472-ebb0d2d2-da0a-4f19-9ef5-684dab98dc71.gif" width="232" height="426" >

   ## rive动画
   网址 https://rive.app/， 强大的制作动画工具

   <img src="https://user-images.githubusercontent.com/12110768/132090373-a3e37568-f5a9-4ded-be68-4c511b3e4354.gif" width="232" height="426" >

   ## RiveBottomTab

   rive 底部动态Tab，定义了五个tab item，中间悬浮突出按钮，适合使用圆形按钮

   |参数 |说明|
   | -------------|--------------|
   |children| tab item|
   |floatWidget| 中间悬浮按钮|
   |floatText| 中间悬浮text|
   |tabSelect| tab选中回调|
   |centerRadius| 中间悬浮按钮半径|
   
    <img src="https://user-images.githubusercontent.com/12110768/133272309-e30dc302-7848-4bed-909c-75cf13823b35.gif" width="232" height="426" >