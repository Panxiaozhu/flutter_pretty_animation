# flutter_pretty_animation
收集和编写漂亮的动画合集
## AnimationGroupWidget
传入一个widget数组，横向排序，随机发散收拢

<img src="https://user-images.githubusercontent.com/12110768/122944234-37dc0800-d3aa-11eb-8d39-c95b759a5c0f.gif" width="232" height="426" >

## AnimationlikeWidget

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
 |milliseconds| 动画刷出频率|
 |IconData| material icon|

 <img src="https://user-images.githubusercontent.com/12110768/122944447-6b1e9700-d3aa-11eb-86c7-0a3c37671ccb.gif" width="232" height="426" >

 ## MultipleFabWidget

  |参数 |说明|
  | -------------|--------------|
  |children| 按钮集合|
  |openWidget| 控制按钮|
  |verticalSpace| 高间距|
  |rightSpace| 右边距离|

  <img src="https://user-images.githubusercontent.com/12110768/122944217-3579ae00-d3aa-11eb-8976-a1d9497e5d60.gif" width="232" height="426" >