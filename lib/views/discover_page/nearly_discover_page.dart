import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

/**
 * 发现 - 附近
 * */
class DiscoverNearlyPage extends StatefulWidget {
  DiscoverNearlyPage();

  _DiscoverNearlyPage createState() => _DiscoverNearlyPage();
}

class _DiscoverNearlyPage extends State<DiscoverNearlyPage>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController = new ScrollController();

  int _page = 0;
  int _size = 10;

  var posts = [];
  var postsTemps = [];

  List imgList = [
    // "http://yanxuan.nosdn.127.net/8b30eeb17c831eba08b97bdcb4c46a8e.png",
    // "http://yanxuan.nosdn.127.net/a196b367f23ccfd8205b6da647c62b84.png",
    // "http://yanxuan.nosdn.127.net/149dfa87a7324e184c5526ead81de9ad.png",
    // "http://yanxuan.nosdn.127.net/88dc5d80c6f84102f003ecd69c86e1cf.png",
    // "http://yanxuan.nosdn.127.net/8b9328496990357033d4259fda250679.png",
    'https://picsum.photos/id/101/548/338',
    "http://yanxuan.nosdn.127.net/c39d54c06a71b4b61b6092a0d31f2335.png",
    "http://yanxuan.nosdn.127.net/ee92704f3b8323905b51fc647823e6e5.png",
    "http://yanxuan.nosdn.127.net/e564410546a11ddceb5a82bfce8da43d.png",
    "http://yanxuan.nosdn.127.net/56f4b4753392d27c0c2ccceeb579ed6f.png",
    "http://yanxuan.nosdn.127.net/6a54ccc389afb2459b163245bbb2c978.png",
    "http://yanxuan.nosdn.127.net/65091eebc48899298171c2eb6696fe27.jpg",
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569842561051&di=45c181341a1420ca1a9543ca67b89086&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201504%2F17%2F20150417212547_VMvrj.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1570437233&di=9239dbc3237f1d21955b50e34d76c9d5&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201508%2F30%2F20150830095308_UAQEi.thumb.700_0.jpeg'
  ];

  List<String> headerUrlList = [
    "https://img2.baidu.com/it/u=1267931373,3662510004&fm=26&fmt=auto&gp=0.jpg",
    "https://img2.baidu.com/it/u=1611641888,1284713904&fm=26&fmt=auto&gp=0.jpg",
    "https://i02piccdn.sogoucdn.com/dab96183e4af5fa9"
  ];

  var isBottom = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: SafeArea(
          top: false, //去掉状态栏
          child: Offstage(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Container(
          color: Colors.grey[100],
          child: StaggeredGridView.countBuilder(
              controller: _scrollController,
              itemCount: posts.length + 1,
              primary: false,
              crossAxisCount: isBottom ? 4 : 4, //不能动态 所有都变的
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              staggeredTileBuilder: (index) => StaggeredTile.fit(2),
              itemBuilder: (BuildContext context, int index) {
                if (index == posts.length) {
                  return new Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 4.0,
                      ),
                    ),
                  );
                } else {
                  return TileCard(
                    img: '${posts[index]['images']}',
                    title: '${posts[index]['title']}',
                    author: '${posts[index]['userName']}',
                    authorUrl: '${posts[index]['iconUrl']}',
                    type: '${posts[index]['type']}',
                    worksAspectRatio: posts[index]['worksAspectRatio'],
                  );
                }
              }),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  // 下拉刷新数据
  Future<Null> _refreshData() async {
    _page = 0;
    _getPostRefreshData();
  }

  // 上拉加载数据
  void _addMoreData() {
    _page++;
    Future.delayed(Duration(seconds: 2)).then((e) {
      _getForDataMore(true);
      print("_page :" + _page.toString() + "--" + posts.length.toString());
      setState(() {});
    });
  }

  void _getPostRefreshData() async {
    await Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        posts.clear();
        _getForDataMore(false);
        posts = postsTemps;
        print('result: ' + posts.toString());
      });
    });
  }

  void _getForDataMore(bool _beMore) {
    if (!_beMore) {
      postsTemps.clear();
    }
    for (var i = 0; i < 7; i++) {
      if (_beMore) {
        posts.insert(
          posts.length,
          {
            "images": imgList[i % 11],
            "userName": "我来也",
            "title": "这世界很美好的!",
            "iconUrl": headerUrlList[i % 3],
            "type": "EXISE",
            "worksAspectRatio": 2.0,
          },
        );
        // posts.add(
        //   {
        //     "images": imgList[i % 5],
        //     "userName": "我来也",
        //     "title": "这世界很美好的!",
        //     "iconUrl": headerUrlList[i % 3],
        //     "type": "EXISE",
        //     "worksAspectRatio": 2.0,
        //   },
        // );
      } else {
        postsTemps.add(
          {
            "userName": "我来也",
            "title": "这世界很美好的!",
            "iconUrl": headerUrlList[i % 3],
            "images": imgList[i],
            "type": "EXISEs",
            "worksAspectRatio": 2.0,
          },
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // 首次拉取数据
    setState(() {
      posts.clear();
      _getForDataMore(true);
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        isBottom = true;
        _addMoreData();
        print('我监听到底部了!');
      } else {
        isBottom = false;
      }
    });
  }
}

class TileCard extends StatelessWidget {
  final String img;
  final String title;
  final String author;
  final String authorUrl;
  final String type;
  final double worksAspectRatio;
  TileCard(
      {this.img,
      this.title,
      this.author,
      this.authorUrl,
      this.type,
      this.worksAspectRatio});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.blueAccent[100],
            child: CachedNetworkImage(imageUrl: '$img'),
          ),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
            margin: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
            child: Text(
              '$title',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(30),
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(20),
                bottom: ScreenUtil().setWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage('$authorUrl'),
                  radius: ScreenUtil().setWidth(30),
                  // maxRadius: 40.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                  width: ScreenUtil().setWidth(120),
                  child: Text(
                    '$author',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(25),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(80)),
                  child: Text(
                    '${type == 'EXISE' ? '练习' : '其他'}',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(25),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
