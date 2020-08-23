import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play/utils/UiUtils.dart';

class PersonalCenterPage extends StatefulWidget {
  PersonalCenterPage();
  TapGestureRecognizer tapGestureRecognizer = new TapGestureRecognizer();
  _PersonalCenterPage createState() => _PersonalCenterPage();
}

class _PersonalCenterPage extends State<PersonalCenterPage> {
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
          expandedHeight: 200.0,
          flexibleSpace: const FlexibleSpaceBar(
            title: const Text('personal'),
          ),
        ),

        new SliverPadding(padding: EdgeInsets.all(0.01),
            sliver: SliverToBoxAdapter(
            child: Container(
//            child: new Text("fdkjfk"),
            height: 8,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
        )),
        ),

        new SliverPadding(padding: EdgeInsets.symmetric(horizontal: 5.0),
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
              childAspectRatio: 2,//纵轴缩放比例
              crossAxisSpacing: 3.0,
              mainAxisSpacing: 10.0,
            ),
            delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return new Container(
                  alignment: Alignment.center,
                  height: 15,
                  color: Colors.teal[100 * (index % 9)],
                  child: _rengerGridView(index),

                );
              },
              childCount: 4,
            ),
          ),
        ),



        new SliverPadding(padding: EdgeInsets.all(0.1),
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
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            },
            childCount: 10,
          ),
        )
      ],
    );
  }
}

 _rengerGridView(int index) {

  switch(index) {
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
                  child:
                  Padding(
                  padding: new EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child:   SizedBox(
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
              ),

              ),

            ],
//              recognizer: apGestureRecognizer..onTap = (){//手势事件
//
//              }
          ),

          ),

        onPressed:() => UiUtils.flutterToastNormal("喜爱")
      );

    case 1:
      return new FlatButton(
          child: Text(
            "收藏",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),),

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
              fontSize: 12,
            ),),

          onPressed: () {
            UiUtils.flutterToastNormal("精品");
          }
      );
    case 3:
      return new FlatButton(
        child: Text(
          "历史",
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),),

        onPressed: () {
          UiUtils.flutterToastNormal("历史");
        },);
  }
}
