import 'package:flutter/material.dart';
import 'package:flutter_play/components/search_input.dart';
import 'package:flutter_play/model/widget.dart';
import 'package:flutter_play/resouces/widget_name_to_icon.dart';
import 'package:flutter_play/utils/UiUtils.dart';
import 'package:flutter_play/utils/data_utils.dart';
import 'package:flutter_play/widgets/custom_underline_tab_Indicator.dart';

import 'discover_discover_page.dart';
import 'live_discover_page.dart';
import 'nearly_discover_page.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage();

  _DiscoverPage createState() => _DiscoverPage();
}

class _DiscoverPage extends State<DiscoverPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var _currentIndex = 0;
  List<Tab> list1 = new List();
  List<Widget> list2 = new List();
  var tabTitle = ['发现', '直播', '附近'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//初始化
    _tabController = new TabController(vsync: this, length: tabTitle.length);
    //添加监听，记录当前切换到的页面索引
    _tabController.addListener(() {
      setState(() => _currentIndex = _tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Column(
      children: <Widget>[
        new Container(
          height: 80,
          padding: EdgeInsets.only(top: 35),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(0)),
          child: new Row(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(right: 10.0, top: 0.0, left: 0.0),
//            child: new Icon(Icons.search,size: 25.0,color: Colors.grey,),
              ),
              new Expanded(
                child: new Container(
                  width: 10, //无用
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(30)),
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.only(
                            right: 4.0, top: 0.0, left: 9.0),
                        child: new Icon(
                          Icons.search,
                          size: 22.0,
                          color: Colors.grey,
                        ),
                      ),
                      new Expanded(
                          child: new MaterialSearchInput(
                        placeholder: '搜索',
//                  getResults: getResults,
                      )),
                    ],
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(right: 2.0, top: 0.0, left: 20.0),
//            child: new Icon(Icons.assignment_turned_in,size: 25.0,color: Colors.grey,),
              ),
              _getTabBar(_currentIndex),
              new Padding(
                padding: new EdgeInsets.only(right: 18.0, top: 0.0, left: 20.0),
                child: new InkWell(
                  onTap: () => UiUtils.flutterToastNormal("签到"),
                  child: Icon(
                    Icons.assignment_turned_in,
                    size: 25.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(right: 10.0, top: 0.0, left: 0.0),
                child: new InkWell(
                  child: new Icon(
                    Icons.shopping_cart,
                    size: 25.0,
                    color: Colors.grey,
                  ),
                  onTap: () => UiUtils.flutterToastNormal("购物"),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: TabBarView(controller: _tabController, children: <Widget>[
            Container(child: DiscoverDiscoverPage()),
            Center(child: DiscoverLivePage()),
            Center(child: DiscoverNearlyPage()),
          ]),
          height: MediaQuery.of(context).size.height - 80 - 56, //加底部tab高度
        )
      ],
    );

//    return Scaffold(
//      appBar: PreferredSize(
//          child: AppBar(
//            leading: Icon(Icons.arrow_forward),
//            backgroundColor: Colors.lightGreen,
//            bottom: _getTabBar(_currentIndex),
//            //标题是否居中显示，默认值根据不同的操作系统，显示方式不一样,true居中 false居左
//            centerTitle: false,
//          ),
//          preferredSize: Size.fromHeight(48)),
//
//      primary: true, //默认true 是展开的
//      body: TabBarView(controller: _tabController, children: <Widget>[
//        Center(child: Text(tabTitle[0])),
//        Center(child: Text(tabTitle[1])),
//        Center(child: Text(tabTitle[2])),
//      ]),
//    );
  }

  Widget _getTabBar(int index) {
    var tabbar = new TabBar(
      controller: _tabController,
      labelPadding:
          EdgeInsets.only(left: 3.0, top: 0.0, right: 3.0, bottom: 0.0),
      tabs: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child: Text(tabTitle[0]),
              padding: EdgeInsets.only(top: 1.0),
              height: 35,
              width: 40,
              alignment: Alignment.center,
            )
          ],
        ),
        Column(children: <Widget>[
          Container(
            child: Text(tabTitle[1]),
            padding: EdgeInsets.only(top: 1.0),
            height: 35,
            width: 40,
            alignment: Alignment.center,
          )
        ]),
        Column(children: <Widget>[
          Container(
            child: Text(tabTitle[2]),
            padding: EdgeInsets.only(top: 1.0),
            height: 35,
            width: 40,
            alignment: Alignment.center,
          )
        ]),
      ],
      labelColor: Colors.black,
      labelStyle: TextStyle(
          fontSize: 18,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold),
      //tabs 的长度超出屏幕宽度后，TabBar，是否可滚动
      //设置为false tab 将平分宽度，为true tab 将会自适应宽度
      isScrollable: true,
      //字体发生变化的时候 会有一个动画导致会有抖动问题
      //解决方法可以对字体进行设置大小而不在这个style里设置
      unselectedLabelStyle: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold),
      unselectedLabelColor: Colors.black,
      indicatorColor: Colors.pink,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 3,
      //
      indicator: CustomUnderlineTabIndicator(
          strokeCap: StrokeCap.round,
          insets: EdgeInsets.only(left: 3, right: 3),
          borderSide: BorderSide(width: 3.0, color: Colors.red)),
    );

    return Container(
      child: tabbar,
      width: 140,
    );
  }
}
