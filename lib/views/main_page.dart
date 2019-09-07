
import 'package:flutter/material.dart';
import 'package:flutter_play/components/search_input.dart';
import 'package:flutter_play/model/user_info.dart';
import 'package:flutter_play/model/widget.dart';
import 'package:flutter_play/resouces/widget_name_to_icon.dart';
import 'package:flutter_play/utils/data_utils.dart';

import 'discover_page/discover_page.dart';
import 'home_page/home_page.dart';
import 'hot_list_page/hot_list_page.dart';
import 'login_page.dart';
import 'personal_center_page/personal_center_page.dart';

class MainPage extends StatefulWidget{

  final UserInformation userInfo;

  MainPage(this.userInfo);

  _HomePage createState() => _HomePage();
}

class _HomePage extends State<MainPage>{

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

    _list
    ..add(HomePage())
    ..add(HotListPage())
    ..add(DiscoverPage())
    ..add(PersonalCenterPage());
//    ..add(LoginPage());

  }
  @override
  Widget build(BuildContext context) {

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

    );
  }

  renderAppBar(BuildContext context, Widget widget, int currentIndex) {

    if(currentIndex == 0){
      return AppBar(title: buildSearchInput(context));
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