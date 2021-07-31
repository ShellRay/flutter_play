import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play/bean/image_text_item_bean.dart';
import 'package:flutter_play/components/BannerWidget.dart';
import 'package:flutter_play/model/banner_Item.dart';
import 'package:flutter_play/utils/ScreenAdaper.dart';
import 'item.dart';

/**
 * 发现 - 发现
 * */
class DiscoverDiscoverPage extends StatefulWidget {
  DiscoverDiscoverPage();

  _DiscoverDiscoverPage createState() => _DiscoverDiscoverPage();
}

class _DiscoverDiscoverPage extends State<DiscoverDiscoverPage>
    with AutomaticKeepAliveClientMixin {
  List<String> headerUrlList = [
    "https://img2.baidu.com/it/u=1267931373,3662510004&fm=26&fmt=auto&gp=0.jpg",
    "https://img2.baidu.com/it/u=1611641888,1284713904&fm=26&fmt=auto&gp=0.jpg",
    "https://i02piccdn.sogoucdn.com/dab96183e4af5fa9"
  ];

  List<ImageTextBean> dataList = [
    new ImageTextBean(
        "https://img2.baidu.com/it/u=1267931373,3662510004&fm=26&fmt=auto&gp=0.jpg", "京东超市"),
    new ImageTextBean(
        "https://img2.baidu.com/it/u=1611641888,1284713904&fm=26&fmt=auto&gp=0.jpg", "生活服务"),
    new ImageTextBean(
        "https://i02piccdn.sogoucdn.com/dab96183e4af5fa9", "数码电气"),
    new ImageTextBean("https://img2.baidu.com/it/u=1611641888,1284713904&fm=26&fmt=auto&gp=0.jpg", "领京豆"),
    new ImageTextBean(
        "https://i02piccdn.sogoucdn.com/dab96183e4af5fa9", "潮流服饰"),
    new ImageTextBean("https://img2.baidu.com/it/u=1611641888,1284713904&fm=26&fmt=auto&gp=0.jpg", "领券"),
    new ImageTextBean(
        "https://img2.baidu.com/it/u=1267931373,3662510004&fm=26&fmt=auto&gp=0.jpg", "京东生鲜"),
    new ImageTextBean("https://img2.baidu.com/it/u=1611641888,1284713904&fm=26&fmt=auto&gp=0.jpg", "借钱"),
    new ImageTextBean(
        "https://i02piccdn.sogoucdn.com/dab96183e4af5fa9", "京东到家"),
    new ImageTextBean(
        "https://img2.baidu.com/it/u=1611641888,1284713904&fm=26&fmt=auto&gp=0.jpg", "PLUS会员"),
  ];

// ListView嵌套GridView解决方案：（ListView嵌套ListView同理）
// GridView中添加：

//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
// ListView中添加：

// shrinkWrap: true,

  @override
  Widget build(BuildContext context) {
    // ScreenAdaper.init(context);

    List<BannerItem> bannerList = [];

    BannerItem item = BannerItem.defaultBannerItem(
        '''https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3403217268,408121325&fm=26&gp=0.jpg''',
        '''金秋风暴''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3416996724,3150088939&fm=26&gp=0.jpg''',
        '''舒适生活''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''https://img2.baidu.com/it/u=1267931373,3662510004&fm=26&fmt=auto&gp=0.jpg''',
        '''国际信任专享''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3261159174,80362990&fm=26&gp=0.jpg''',
        '''抢第二件半价''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''http://i3.sinaimg.cn/gm/o/i/2008-09-03/U1901P115T41D148033F757DT20080903105357.jpg''',
        '''现货开抢''');
    bannerList.add(item);

    return new Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          /**
       * Flutter listView 顶部有距离，无法置顶  解决办法：ListView中添加EdgeInsets.only(top: 0)； GridView 同理
       * */
          padding: EdgeInsets.only(top: 0, bottom: 0),
          shrinkWrap: true,
          children: <Widget>[
            new BannerWidget(
              180.0,
              bannerList,
              selectedColor: Colors.pink,
              unSelectedColor: Colors.grey[200],
              bannerPress: (pos, item) {
                print('第 $pos 点击了');
              },
            ),
            new Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 5),
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.yellow[300],
                ),
              ],
            ),
            Container(
              decoration: new BoxDecoration(
                color: Colors.pink[300],
              ),
              margin: EdgeInsets.only(top: 0, left: 0),
              // height: ScreenAdaper.height(50),
              height: 50,
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 0, bottom: 0),
              width: double.infinity, //寬度自適應
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) =>
                    VerticalDivider(width: 15.0, color: Colors.white), // 添加分割线

                itemBuilder: (contxt, index) {
                  Padding:
                  EdgeInsets.only(left: 0);
                  return CircleAvatar(
                    // 圆形头像的控件
                    backgroundImage:
                        new NetworkImage(headerUrlList[index]), // 图片
                    backgroundColor: Colors.white,
                    radius: 25.0, // 图片的圆角
                  );
                },
                itemCount: headerUrlList.length,
              ),
            ),
            new Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 5),
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.yellow[300],
                ),
              ],
            ),
            Container(
                decoration: new BoxDecoration(
                  // color: Color(0xFF000000),
                  color: Colors.blue[200],
                ),
                margin: EdgeInsets.only(right: 0, left: 0),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 0, bottom: 0),
                width: double.infinity,
                child: GridView.builder(
                    padding: EdgeInsets.only(top: 8, bottom: 0),
                    physics: new NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 5.0,
                      childAspectRatio: 1 / 1, //item自适应
                    ),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: new NetworkImage(
                                dataList[index].imageurl), // 图片
                            backgroundColor: Colors.white,
                            radius: 18.0, // 图片的圆角
                          ),
                          Container(
                            height: 4,
                            color: Colors.blue[200],
                          ),
                          Text(
                            dataList[index].wname,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: dataList.length)),
            new Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/shop_item_img.png",
                fit: BoxFit.fill,
              ),
            ),
            Container(
                decoration: new BoxDecoration(
                  // color: Color(0xFF000000),
                  color: Colors.grey[200],
                ),
                margin: EdgeInsets.only(right: 0, left: 0),
                // height: ScreenAdaper.height(50),
                // height: 1050,
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 0, bottom: 0),
                width: double.infinity,
                child: GridView.builder(
                    primary: true,
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true, //是否根据子widget的总长度来设置GridView的长度
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 7 / 11, //item自适应
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: new BoxDecoration(
                          //背景
                          color: Colors.white,
                          //设置四周圆角 角度
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          //设置四周边框
                          // border: new Border.all(width: 1, color: Colors.white),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start, //左对齐
                          children: <Widget>[
                            new Container(
                              height: 160,
                              decoration: new ShapeDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  alignment: Alignment.topLeft,
                                  image: NetworkImage(
                                    dataList[index].imageurl,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                //ShapeBorder  ShapeBorder 用于设置形状和轮廓，比如圆形，矩形，圆角矩形等。常用于 Container 中
                                // BeveledRectangleBorder
                                // BoxBorder
                                // Border
                                // BorderDirectional
                                // CircleBorder
                                // ContinuousRectangleBorder
                                // RoundedRectangleBorder
                                // StadiumBorder
                                // InputBorder
                                // OutlineInputBorder
                                // UnderlineInputBorder
                                shape: RoundedRectangleBorder(
                                  //圆角  BeveledRectangleBorder//斜切
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0)),
                                ),
                              ),
                            ),
                            Container(
                              height: 4,
                              color: Colors.transparent,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text.rich(
                                TextSpan(
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                        child: SizedBox(
                                      width: 30,
                                      height: 18,
                                      child: Card(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 4, 4, 0),
                                          elevation: 0,
                                          color: Colors.red,
                                          child: Center(
                                              child: Text(
                                            '自营',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 9,
                                            ),
                                          ))),
                                    )),
                                    TextSpan(
                                      text:
                                          "小米全面屏电视 43 英 寸PRO E43S 4K 超清数码家庭影院",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),

                                    //  Text(
                                    //   "小米全面屏电视 43 英 寸PRO E43S 4K 超清数码家庭影院",
                                    //   style: TextStyle(
                                    //     color: Colors.black,
                                    //     fontSize: 12,
                                    //   ),
                                    //   maxLines: 2,
                                    //   overflow: TextOverflow.ellipsis,//省略号
                                    // ),
                                  ],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 9, top: 8, bottom: 8),
                              child: Text(
                                "超高清分辨率",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 9,
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 8,
                                ),
                                new RichText(
                                  text: new TextSpan(
                                    // 注意:TextSpan需要指定样式
                                    // TextSpan子组件会继承父组件的样式
                                    style: new TextStyle(
                                      fontSize: 15.0, //设置大小
                                      color: Colors.red, //设置颜色
                                    ),
                                    children: <TextSpan>[
                                      new TextSpan(
                                          text: '￥1599',
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      new TextSpan(
                                          text: '.00',
                                          style: new TextStyle(
                                              fontSize: 12)), //设置粗体
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(''), // 中间用Expanded控件
                                ),
                                Container(
                                  height: 20,
                                  width: 40,
                                  alignment: Alignment(0, 0),
                                  decoration: new BoxDecoration(
                                    //背景
                                    color: Colors.grey[200],
                                    //设置四周圆角 角度
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0)),
                                  ),
                                  child: Text(
                                    "看相似",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dataList.length)),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
