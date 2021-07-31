import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play/components/search_input.dart';
import 'package:flutter_play/model/user_info.dart';
import 'package:flutter_play/model/widget.dart';
import 'package:flutter_play/resouces/widget_name_to_icon.dart';
import 'package:flutter_play/routers/application.dart';
import 'package:flutter_play/routers/routers.dart';
import 'package:flutter_play/utils/UiUtils.dart';
import 'package:flutter_play/utils/data_utils.dart';
import 'package:flutter_play/views/discover_page/scrollable_demo_State.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';

import 'discover_page/discover_page.dart';
import 'discover_page/scrollable_demo_State.dart';
import 'home_page/home_page.dart';
import 'hot_list_page/hot_list_page.dart';
import 'personal_center_page/personal_center_page.dart';

class MainPage extends StatefulWidget {
  final UserInformation userInfo;

  MainPage(this.userInfo);

  _HomePage createState() => _HomePage();
}

class _HomePage extends State<MainPage> {
  List<Widget> _list = List();
  int _currentIndex = 0;
  List tabData = [
    {'text': '首页', 'icon': Icon(Icons.home)},
    {'text': '热门', 'icon': Icon(Icons.chrome_reader_mode)},
    {'text': '发现', 'icon': Icon(Icons.find_in_page)},
    {'text': '个人中心', 'icon': Icon(Icons.account_circle)},
  ];

  String appBarTitle;

  List<BottomNavigationBarItem> _myTabs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    appBarTitle = tabData[0]['text'];

    for (int i = 0; i < tabData.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    _list
      ..add(HomePage())
      ..add(HotListPage())
      ..add(DiscoverPage())
      ..add(PersonalCenterPage());

//    Scaffold 主要的属性说明
//    appBar：显示在界面顶部的一个 AppBar
//    相关连接：https://flutterchina.club/catalog/samples/
//
//    body：当前界面所显示的主要内容
//
//    floatingActionButton： 在 Material 中定义的一个功能按钮。
//
//    persistentFooterButtons：固定在下方显示的按钮。https://material.google.com/components/buttons.html#buttons-persistent-footer-buttons
//
//    drawer：侧边栏控件
//
//    bottomNavigationBar：显示在底部的导航栏按钮栏。可以查看文档：Flutter学习之制作底部菜单导航
//
//    backgroundColor：背景颜色
//
//    resizeToAvoidBottomPadding： 控制界面内容 body
//    是否重新布局来避免底部被覆盖了，比如当键盘显示的时候，重新布局避免被键盘盖住内容。默认值为 true。

    return new Scaffold(
      appBar: renderAppBar(context, widget, _currentIndex),
      body: IndexedStack(
        index: _currentIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,

        currentIndex: _currentIndex,

        onTap: _onItemTapped,
        //shifting :按钮点击移动效果
        //fixed：固定
        type: BottomNavigationBarType.fixed,

        fixedColor: Theme.of(context).primaryColor,

        backgroundColor: Color(0xFFFFFFFF),
      ),
      floatingActionButton: renderFloatButton(context, _currentIndex),
    );
  }

  renderAppBar(BuildContext context, Widget widget, int currentIndex) {
    if (currentIndex == 0) {
      return AppBar(title: buildSearchInput(context));
    }
  }

  renderFloatButton(BuildContext context, int currentIndex) {
    if (currentIndex == 2) {
      return FloatingActionButton(
        child: Icon(
          Icons.add_a_photo,
          size: 25,
        ),
        mini: true,
        onPressed: () {
// Application.router.navigateTo(context,
          // ScrollableDemo(), transition: TransitionType.inFromRight);

          UiUtils.flutterToastNormal("this is floatingaction");
          print("click");

          Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => ScrollableDemo(),
              ));
        },
        tooltip: "按这么长时间干嘛",
        foregroundColor: Colors.white,
        backgroundColor: Colors.cyanAccent,
      );
    }
  }

  void _onItemTapped(int value) {
    setState(() {
      _currentIndex = value;
      appBarTitle = tabData[value]['text'];
    });
  }

  Widget buildSearchInput(BuildContext context) {
    return new SearchInput((value) async {
      if (value != '') {
        print('value ::: $value');
        // List<WidgetPoint> list = await widgetControl.search(value);
        List<WidgetPoint> list = await DataUtils.searchWidget(value);
        return list
            .map((item) => new MaterialSearchResult<String>(
                  value: item.name,
                  icon: WidgetName2Icon.icons[item.name] ?? null,
                  text: 'widget',
                  onTap: () {
////            onWidgetTap(item, context);
                  },
                ))
            .toList();
      } else {
        return null;
      }
    }, (value) {}, () {});
  }
}
