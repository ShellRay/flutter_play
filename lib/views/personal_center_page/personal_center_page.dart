import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play/utils/UiUtils.dart';

class PersonalCenterPage extends StatefulWidget {
  PersonalCenterPage();

  TapGestureRecognizer tapGestureRecognizer = new TapGestureRecognizer();

  _PersonalCenterPage createState() => _PersonalCenterPage();
}

class _PersonalCenterPage extends State<PersonalCenterPage> {
   String userAvatar =
      "https://img2.baidu.com/it/u=1678948314,1083480950&fm=26&fmt=auto&gp=0.jpg";
   var userName;

   var items=["红包签到","会员中心","私房红包","U先试用","我的服务","领券中心","天天夺宝","设置中心"];
   var itemIcons=[Icons.print,Icons.stay_current_portrait,Icons.credit_card,Icons.speaker_notes,Icons.room_service,Icons.golf_course,Icons.attach_money,Icons.settings];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new CustomScrollView(
      reverse: false,
      shrinkWrap: false,
      slivers: <Widget>[
//    SliverAppBar （类似于CoordinatorLayout+AppBarLayout+CollapsingToolbarLayout）
//    SliverGridv（类似于RecyClerView或者GrideView)
//    SliverFixedExtentList(类似于RecyClerView或者ListView)

        new SliverAppBar(
          pinned: true,
          expandedHeight: 240.0,
          primary: true,
          //是否显示在状态栏的下面,false就会占领状态栏的高度 指的的是标题栏部分
          backgroundColor: Colors.blue,
          leading: new IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print("添加");
              },
            ),
            new IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                print("更多");
              },
            ),
          ],
//          iconTheme: new IconThemeData(color: Colors.transparent),//标题栏的style 设置透明的话leading actions不会显示
          flexibleSpace: new FlexibleSpaceBar(
            background:
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightGreenAccent, Colors.yellowAccent],
                ),
              ),
              child:_rengerSliverAppBarColumn(),
            ),
          )
          //添加背景图片
//          new FlexibleSpaceBar(
//            background: Image.asset("assets/images/p2.png", fit: BoxFit.fill),
//          ),

        ),

        new SliverPadding(
          padding: EdgeInsets.all(0.01),
          sliver: SliverToBoxAdapter(
              child: Container(
//            child: new Text("fdkjfk"),
            height: 8,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          )),
        ),

        new SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          sliver: new SliverGrid(
            gridDelegate:
//      new SliverGridDelegateWithMaxCrossAxisExtent(
//        maxCrossAxisExtent: 200.0,
//        mainAxisSpacing: 10.0,//间距 上下item的
//        crossAxisSpacing: 10.0,//间距 左右
//        childAspectRatio: 4.0,
//
//      ),
                new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 2, //纵轴缩放比例
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 10.0,
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new Container(
                  alignment: Alignment.center,
                  height: 15,
                  color: Colors.lightGreen[100 * (index % 9)],
                  child: _rengerGridView(index),
                );
              },
              childCount: 4,
            ),
          ),
        ),

        new SliverPadding(
          padding: EdgeInsets.all(0.1),
          sliver: SliverToBoxAdapter(
              child: Container(
            height: 8,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          )),
        ),

        new SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return new InkWell(
                  onTap: (){
                    _sliverFixedExtentItemClick(index);
                  },
                  child:new Container(
                alignment: Alignment.center,
                height: 50,
//                color: Colors.white[100 * (index % 9)],
                color: Colors.white,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 18,
                    ),

                    Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          WidgetSpan(
                          alignment:PlaceholderAlignment.middle,//默认是底部
                            child: Padding(
                              padding: new EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: SizedBox(
                                width: 10,
                                height: 50,
                                child: new Icon(
                                    itemIcons[index]
                                ),
                              ),
                            ),
                          ),

                          TextSpan(
                            text: items[index],
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],

                      ),
                    ),

                    Expanded(
                      child: Text(''), // 中间用Expanded控件
                    ),
                    if(index == 0 || index == 2|| index == 4|| index == 5)Icon(Icons.arrow_forward),
                    Container(
                      height: 50,
                      width: 10,
                    )

                  ],
                ),

              )
                  );
            },
            childCount: 8,
          ),
        )
      ],
    );
  }

   _rengerSliverAppBarColumn(){

     return new InkWell(
         onTap: () {
           userAvatar == null ? debugPrint('登录') : debugPrint('用户信息');
         },

         child: new Column(
//                mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             new Row(
                 mainAxisAlignment: MainAxisAlignment.end, //横轴
                 crossAxisAlignment: CrossAxisAlignment.center, //纵轴
                 children: <Widget>[
                   new Container(
                     margin:
                     const EdgeInsets.fromLTRB(0.0, 40.0, 100.0, 0.0),
                     child: new InkWell(
                         child: new Icon(
                           Icons.settings,
                           size: 20,
                         ),
                         onTap: () {
                           UiUtils.flutterToastNormal("设置");
                         }),
                   ),
                 ]),
             new Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   new Container(
                     margin:
                     const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                     child: new InkWell(
                         child: userAvatar == null
                             ? new Image.asset(
                           "assets/images/normal_user_icon.png",
                           width: 60.0,
                           height: 60.0,
                         )
                             : new Container(
                           width: 60.0,
                           height: 60.0,
                           decoration: new BoxDecoration(
                               shape: BoxShape.circle, //图片的形状
                               color: Colors.transparent,
                               image: new DecorationImage(
                                   image:
                                   new NetworkImage(userAvatar),
                                   fit: BoxFit.cover),
                               border: new Border.all(
                                   color: Colors.white, width: 2.0)),
                         ),
                         onTap: () =>
                             UiUtils.flutterToastNormal("点击头像登录")),
                   ),
                   new Container(
                       margin:
                       const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                       child: new InkWell(
                           child: new Text(
                             userName == null ? '点击头像登录' : userName,
                             style: new TextStyle(
                                 color: Colors.white, fontSize: 16.0),
                           ),
                           onTap: () =>
                               UiUtils.flutterToastNormal("点击头像登录")))
                 ]),
           ],
         ));
   }


   _rengerGridView(int index) {
     switch (index) {
       case 0:
         return new FlatButton(
             child: Text.rich(
               TextSpan(
                 children: <InlineSpan>[
//              WidgetSpan(
//                  child: SizedBox(
//                    width: 120,
//                    height: 50,
//                    child: Card(
//                        color: Colors.blue,
//                        child: Center(child: Text('Hello World!'))),
//                  )),
                   WidgetSpan(
                     child: Padding(
                       padding: new EdgeInsets.fromLTRB(0, 0, 5, 0),
                       child: SizedBox(
                         width: 15,
                         height: 15,
                         child: new Image.asset(
                           "assets/images/plane.png",
                           fit: BoxFit.cover,
                         ),
                       ),
                     ),
                   ),

                   TextSpan(
                     text: '喜爱',
                     style: TextStyle(
                       color: Colors.black,
                       fontSize: 14,
                     ),
                   ),
                 ],
//              recognizer: apGestureRecognizer..onTap = (){//手势事件
//
//              }
               ),
             ),
             //去掉水波纹
             highlightColor: Colors.transparent,
             splashColor:Colors.transparent,
             onPressed: () => UiUtils.flutterToastNormal("喜爱"));

       case 1:
         return new FlatButton(
             child: Text(
               "收藏",
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 14,
               ),
             ),
             //去掉水波纹
             highlightColor: Colors.transparent,
             splashColor:Colors.transparent,
             onPressed: () {
               UiUtils.flutterToastNormal("收藏");
             }

             );
       case 2:
         return new FlatButton(
             child: Text(
               "精品",
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 14,
               ),
             ),
             //去掉水波纹
             highlightColor: Colors.transparent,
             splashColor:Colors.transparent,
             onPressed: () {
               UiUtils.flutterToastNormal("精品");
             });
       case 3:
         return new FlatButton(
           child: Text(
             "历史",
             style: TextStyle(
               color: Colors.black,
               fontSize: 14,
             ),
           ),
           //去掉水波纹
           highlightColor: Colors.transparent,
           splashColor:Colors.transparent,
           onPressed: () {
             UiUtils.flutterToastNormal("历史");
           },
         );
     }
   }

   _sliverFixedExtentItemClick(int index){

    UiUtils.flutterToastNormal(items[index]);
     switch (index){
       case 0:

         break;
       case 1:

         break;
       case 2:

         break;
       case 3:

         break;
       case 4:

         break;
       case 5:

         break;
       case 6:

         break;
       case 7:

         break;
     }
   }
}


