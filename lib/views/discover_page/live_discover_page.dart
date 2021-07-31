import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play/components/VirtiAutoScroollWidget.dart';
import 'package:flutter_play/model/banner_Item.dart';

/*
 * 发现 - 直播
 * */
class DiscoverLivePage extends StatefulWidget {
  DiscoverLivePage();

  _DiscoverLivePage createState() => _DiscoverLivePage();
}

class _DiscoverLivePage extends State<DiscoverLivePage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  ScrollController _scrollViewController;
  TabController _tabController;
  var tabTitle = ['关注', '热门', '穿搭', "美妆", "鞋包配"];

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(vsync: this, length: tabTitle.length);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 1.0,
        //   title: Text("首页"),
        // ),
        // appBar: PreferredSize(
        //     child: AppBar(
        //       brightness: Brightness.light,
        //       backgroundColor: Colors.white,
        //     ),
        //     preferredSize: Size.fromHeight(0.07)),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
          child: SafeArea(
            top: false, //去掉状态栏
            child: Offstage(),
          ),
        ),
        backgroundColor: Colors.white,
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  pinned: true, //是否悬浮
                  floating: true,
                  expandedHeight: 205,
                  backgroundColor: Colors.white, //默认是主题色颜色
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin, //类型一种是类似覆盖的往上滑动，当前是正常滑动然后悬停
                    background: Container(
                      //头部整个背景颜色
                      padding: EdgeInsets.only(top: 5, bottom: 0),
                      height: double.infinity,
                      color: Color.fromARGB(250, 245, 245, 245),
                      child: Column(
                        children: <Widget>[_buildImage(), _buildTabBarBg()],
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                      preferredSize: Size.fromHeight(47),
                      child: Material(
                        //这里设置tab的背景色
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            //背景的圆角
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                        child: TabBar(
                          controller: _tabController,
                          tabs: tabTitle.map((item) {
                            return Tab(
                              text: item,
                            );
                          }).toList(),
                          isScrollable: false, //可滑动否
                          indicatorColor: Color(0x00ff0000),
                          indicatorWeight: 1,
                          indicator: const BoxDecoration(), //隐藏下选择线
                          // indicator: CustomUnderlineTabIndicator(
                          //     strokeCap: StrokeCap.round,
                          //     insets: EdgeInsets.only(left: 3, right: 3),
                          //     borderSide:
                          //         BorderSide(width: 3.0, color: Colors.red)),

                          indicatorSize: TabBarIndicatorSize
                              .tab, //指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽,TabBarIndicatorSize.tab跟每个tab等宽
                          indicatorPadding: EdgeInsets.only(right: 1.0),
                          labelPadding: EdgeInsets.only(left: 5, right: 5),
                          labelColor: Color.fromARGB(250, 212, 91, 113),
                          labelStyle: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w800),
                          unselectedLabelColor: Color(0xff000000),
                          unselectedLabelStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )))
            ];
          },
          body: TabBarView(
              physics: new NeverScrollableScrollPhysics(), //必须放到前面才能启用
              controller: _tabController,
              children: [
                ListDemo("aaa:"),
                ListDemo("bbb:"),
                ListDemo("ccc:"),
                ListDemo("ccc:"),
                ListDemo("ccc:"),
              ]),
        ));
  }

  Widget _buildImage() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width - 20,
      child: Image.asset(
        "assets/images/shopping_activity_image.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTabBarBg() {
    List<BannerItem> bannerList = [];

    BannerItem item = BannerItem.defaultBannerItem(
        '''https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3403217268,408121325&fm=26&gp=0.jpg''',
        '''529人刚刚剁手了牙齿脱色剂￥67.88''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3416996724,3150088939&fm=26&gp=0.jpg''',
        '''229人刚刚剁手了休闲裤￥78.99''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''https://img2.baidu.com/it/u=1267931373,3662510004&fm=26&fmt=auto&gp=0.jpg''',
        '''352人刚刚剁手了牛仔裤￥29.00''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3261159174,80362990&fm=26&gp=0.jpg''',
        '''752人刚刚剁手了雪纺衫￥299.30''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''http://i3.sinaimg.cn/gm/o/i/2008-09-03/U1901P115T41D148033F757DT20080903105357.jpg''',
        '''852人刚刚剁手了家居服￥129.99''');
    bannerList.add(item);

    return Container(
      //TabBar圆角背景颜色
      height: 30,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: new BoxDecoration(
        //背景
        color: Colors.white,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //设置四周边框
        // border: new Border.all(width: 1, color: Colors.white),
      ),
      // child: ClipRRect(
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(5),
      //         topRight: Radius.circular(5),
      //         bottomLeft: Radius.circular(5),
      //         bottomRight: Radius.circular(5)),
      child: Stack(children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.volume_down,
            size: 22,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30, right: 40),
          alignment: Alignment.centerLeft,
          child: new VirtiAutoScroollWidget(
            30.0,
            bannerList,
            selectedColor: Colors.pink,
            unSelectedColor: Colors.grey[200],
            isHorizontal: false,
            bannerPress: (pos, item) {
              print('第 $pos 点击了');
            },
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Text(
            "更多 >",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        )
      ]),
    );
  }
}

class ListDemo extends StatefulWidget {
  String str;
  ListDemo(String s) {
    str = s;
  }

  @override
  State<StatefulWidget> createState() {
    return ListDemoState(str);
  }
}

class ListDemoState extends State<ListDemo> with AutomaticKeepAliveClientMixin {
  String str;

  ListDemoState(String s) {
    str = s;
  }

  // AutomaticKeepAliveClientMixin 保存页面状态
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildListView(_items);
  }

  @override
  bool get wantKeepAlive => true;

  ScrollController _controller = new ScrollController();
  var _items = new List<String>();
  var _mPage = 0;
  @override
  void initState() {
    super.initState();
    getData();
    _controller.addListener(() {
      //判断是否滑动到了页面的最底部
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        //如果不是最后一页数据，则生成新的数据添加到list里面
        if (_mPage < 4) {
          _retrieveData();
        }
      }
    });
  }

  void _retrieveData() {
    //上拉加载新的数据
    _mPage++;
    Future.delayed(Duration(seconds: 2)).then((e) {
      for (int i = 0; i < 5; i++) {
        _items.insert(_items.length, "这是新加载的第${_items.length}条数据");
      }
      setState(() {});
    });
  }

  void getData() {
    //初始数据源
    for (int i = 0; i < 8; i++) {
      _items.insert(_items.length, "第${_items.length}条原始数据");
      print(_items[i]);
    }
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _mPage = 0;
        _items.clear();
        for (int i = 0; i < 5; i++) {
          _items.insert(_items.length, "第${_items.length}条下拉刷新后的数据");
        }
      });
    });
  }

  @override
  void dispose() {
    //移除监听，防止内存泄漏
    _controller.dispose();
    super.dispose();
  }

  Widget _buildListView(var _items) {
    return new RefreshIndicator(
        notificationPredicate: (ScrollNotification notification) {
          // 返回true即可 下拉刷新
          return false;
        },
        onRefresh: _onRefresh,
        child: Container(
            color: Color.fromARGB(250, 245, 245, 245),
            child: ListView.separated(
                // physics: new NeverScrollableScrollPhysics(),
                controller: _controller,
                padding: EdgeInsets.all(10),
                itemCount: _items.length + 1,
                separatorBuilder: (BuildContext context, int index) => Divider(
                      color: Color.fromARGB(250, 245, 245, 245),
                      height: 15, //分割线区域的高度，并非分割线的高度
                      thickness: 15, //分割线的厚度，真正的分割线的高度
                      // indent: 10,//起点缩进距离
                      // endIndent: 10,//终点缩进距离
                    ),
                itemBuilder: (BuildContext context, int index) {
                  //判断是否构建到了最后一条item
                  if (index == _items.length) {
                    //判断是不是最后一页
                    if (_mPage < 4) {
                      //不是最后一页，返回一个loading窗
                      return new Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                        ),
                      );
                    } else {
                      //是最后一页，显示我是有底线的
                      return new Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: new Text(
                          '我是有底线的!!!',
                          style: TextStyle(color: Colors.blue),
                        ),
                      );
                    }
                  } else {
                    return Container(
                        // color: index == 0 ? Colors.blue : Colors.white,//与boxDecoration冲突
                        height: 160,
                        decoration: new BoxDecoration(
                          //背景
                          color: index == 0 ? Colors.white : Colors.white,
                          //设置四周圆角 角度
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          //设置四周边框
                          border: new Border.all(width: 1, color: Colors.white),
                        ),
                        child: Row(
                          children: [
                            new Container(
                              // constraints: new BoxConstraints.expand(
                              height: 160.0,
                              width: 160.0,
                              // ),
                              decoration: new ShapeDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://img2.baidu.com/it/u=1267931373,3662510004&fm=26&fmt=auto&gp=0.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0)),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 60,
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.only(
                                        left: 5, right: 6, top: 2, bottom: 0),
                                    decoration: new ShapeDecoration(
                                      color: Colors.pinkAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                    child: Text.rich(
                                      TextSpan(
                                        children: <InlineSpan>[
                                          WidgetSpan(
                                            child: Padding(
                                              padding: new EdgeInsets.fromLTRB(
                                                  0, 0, 3, 3),
                                              child: SizedBox(
                                                width: 9,
                                                height: 9,
                                                child: new Image.asset(
                                                  "assets/images/plane.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                            text: '直播中',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.all(5),
                                    child: Image.network(
                                      'https://upload-images.jianshu.io/upload_images/7439651-d5e585fa4baa1e5f.gif?imageMogr2/auto-orient/strip|imageView2/2/w/298/format/webp',
                                      height: 30,
                                      width: 30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            new Container(
                                margin: EdgeInsets.only(left: 10, top: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "童装女装大减价",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Container(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "大咪Vitamin",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        new Container(
                                          decoration: new ShapeDecoration(
                                            color: index % 2 == 0
                                                ? Colors.blueGrey[300]
                                                : Colors.pinkAccent[100],
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(2.0),
                                              ),
                                            ),
                                          ),
                                          padding: EdgeInsets.only(
                                              left: 5,
                                              right: 5,
                                              top: 2,
                                              bottom: 2),
                                          margin: EdgeInsets.only(left: 5),
                                          alignment: Alignment.center,
                                          child: Text.rich(
                                            TextSpan(
                                              children: <InlineSpan>[
                                                WidgetSpan(
                                                  child: Padding(
                                                    padding:
                                                        new EdgeInsets.fromLTRB(
                                                            0, 0, 3, 3),
                                                    child: SizedBox(
                                                      width: 9,
                                                      height: 9,
                                                      child: new Image.asset(
                                                        "assets/images/plane.png",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '百货小精灵',
                                                  style: TextStyle(
                                                    color: index % 2 == 0
                                                        ? Colors.blueGrey
                                                        : Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 28,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          margin: EdgeInsets.only(right: 5),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            child: Image.network(
                                              "https://img2.baidu.com/it/u=1267931373,3662510004&fm=26&fmt=auto&gp=0.jpg",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          margin: EdgeInsets.only(right: 5),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            child: Image.network(
                                              "https://img2.baidu.com/it/u=1267931373,3662510004&fm=26&fmt=auto&gp=0.jpg",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          alignment: Alignment.topRight,
                                          decoration: new ShapeDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                              alignment: Alignment.topLeft,
                                              image: NetworkImage(
                                                "https://img2.baidu.com/it/u=1611641888,1284713904&fm=26&fmt=auto&gp=0.jpg",
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(3.0),
                                              ),
                                            ),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 5,
                                                right: 6,
                                                top: 2,
                                                bottom: 0),
                                            decoration: new ShapeDecoration(
                                              color: Colors.pinkAccent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(3.0),
                                                    bottomLeft:
                                                        Radius.circular(7.0)),
                                              ),
                                            ),
                                            child: Text.rich(
                                              TextSpan(
                                                children: <InlineSpan>[
                                                  TextSpan(
                                                    text: '+90',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))
                          ],
                        ));
                  }
                })));
  }
}
