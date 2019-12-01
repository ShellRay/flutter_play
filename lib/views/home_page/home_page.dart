
import 'package:flutter/material.dart';
import 'package:flutter_play/components/BannerWidget.dart';
import 'package:flutter_play/components/cate_card.dart';
import 'package:flutter_play/model/banner_Item.dart';
import 'package:flutter_play/routers/application.dart';

class HomePage extends StatefulWidget{

  HomePage();

  _HomePage createState()=> _HomePage();
}

class _HomePage extends State<HomePage>{

  List<BannerItem> bannerList = [];

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState

    BannerItem item = BannerItem.defaultBannerItem(
        '''http://pic39.nipic.com/20140327/17556992_134152074389_2.jpg''',
        '''唯美护眼''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''http://e.hiphotos.baidu.com/image/pic/item/4610b912c8fcc3cef70d70409845d688d53f20f7.jpg''',
        '''模特''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1567931119923&di=ffb6498cd7c48f9aaac3cc9b1626ac67&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Ftransform%2F20150504%2Fo5UQ-cczmvup1016017.jpg''',
        '''斯嘉丽''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''http://09.imgmini.eastday.com/mobile/20180413/0bf718e8510ab05fd6d40b2b07a8a809_wmk.jpeg''',
        '''卡哇伊 伦纳德''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''http://i3.sinaimg.cn/gm/o/i/2008-09-03/U1901P115T41D148033F757DT20080903105357.jpg''',
        '''暗黑森林''');
    bannerList.add(item);

    super.initState();

    _scrollController.addListener(() {
//      print("滑动pixels："+_scrollController.position.pixels.toString());
//      print("滑动maxScrollExtent："+_scrollController.position.maxScrollExtent.toString());
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }

  });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body:new RefreshIndicator(
          child:buildGrid(),
          onRefresh: _handleRefresh,
        ),

    );
  }

    Widget buildGrid() {
      // 存放最后的widget
      List<Widget> tiles = [];
      ///添加banner
      tiles.add(new BannerWidget(
        220.0,
        bannerList,
        bannerPress: (pos, item) {
          print('第 $pos 点击了');
        },
      ));

      Application.widgetTree.children.forEach((dynamic item) {
        tiles.add(new CateCard(category: item));
      });
      return new ListView.builder(
//        children: tiles,
        itemCount: tiles.length + 1,

        itemBuilder: (context, i) {

          print(i);
          // 最后一个单词对
          if (i == tiles.length) {
//            return _buildLoadMore();

            return _buildProgressIndicator();

          } else {
            return tiles[i];
          }
        },
        controller: _scrollController,

      );

  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }


  // 处理下拉刷新
  Future _handleRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('refresh');
      setState(() {
//        _suggestions.clear();
//        _suggestions.addAll(generateWordPairs().take(20));
//        return _suggestions;
      });
    });
  }

  // 加载更多
  Future _getMoreData() async {
    print("开始加载更多");
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        // 这里是本地数据，因此在无网的时候也会加载数据
//        _suggestions.addAll(generateWordPairs().take(10));
//        return _suggestions;
      });
    });
  }


  //加载更多widget
  Widget _buildLoadMore() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(

          // 转圈加载中
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.orange),
              ),

              Container(
                height: 1,
                width: 20,
                color: Colors.transparent,
              ),
              new Text(
                "加载更多",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),

              )
            ]
          ),
        ),
      ),
      color: Colors.white70,
    );
  }

  bool _hasMore = false;
  bool isLoading = true;

// 上提加载loading的widget,如果数据到达极限，显示没有更多
  Widget _buildProgressIndicator() {
    if (_hasMore) {

      return new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Center(
            child: Column(
              children: <Widget>[
                new Opacity(
                  opacity: isLoading ? 1.0 : 0.0,
                  child: new CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.blue)),
                ),
                SizedBox(height: 20.0),
                Text(
                  '稍等片刻更精彩...',
                  style: TextStyle(fontSize: 14.0),
                )
              ],
            )
          //child:
        ),
      );
    } else {
      return _buildLoadMore();
    }
  }
}