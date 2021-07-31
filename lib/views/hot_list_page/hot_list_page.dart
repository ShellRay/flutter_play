import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended;
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_play/bean/home_entity.dart';
import 'package:flutter_play/constans/string.dart';
import 'package:flutter_play/utils/data_utils.dart';
import 'package:flutter_play/views/hot_list_page/category.dart';
import 'package:flutter_play/views/hot_list_page/group_buy.dart';
import 'package:flutter_play/views/hot_list_page/new_product.dart';
import 'package:flutter_play/views/hot_list_page/project_selection.dart';
import 'package:flutter_play/widgets/brand.dart';
import 'package:flutter_play/widgets/coupon.dart';
import 'package:flutter_play/widgets/loading_view.dart';
import 'package:flutter_play/widgets/swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HotListPage extends StatefulWidget {
  HotListPage();

  _HotListPage createState() => _HotListPage();
}

class _HotListPage extends State<HotListPage> {
  EasyRefreshController _controller = EasyRefreshController();
  var _items = new List<String>();
  var _mPage = 0;
  HomeEntity _homeEntity;
  @override
  void initState() {
    super.initState();
    _queryHomeData();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // return LoadingView();
    return Container(
      child: EasyRefresh(
        controller: _controller,
        header: BezierCircleHeader(backgroundColor: Colors.blueAccent),
        footer: BezierBounceFooter(backgroundColor: Colors.blueAccent),
        enableControlFinishRefresh: true,
        enableControlFinishLoad: false,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SwiperView(_homeEntity.banner, _homeEntity.banner.length,
                ScreenUtil.instance.setHeight(360.0)),
            Padding(
              padding: EdgeInsets.only(top: 0.0),
            ),
            CategoryMenu(_homeEntity.channel),
            Container(
              height: 40.0,
              alignment: Alignment.center,
              child: Text(Strings.COUPON_AREA),
            ),
            CouponView(_homeEntity.couponList),
            Container(
              height: 40.0,
              alignment: Alignment.center,
              child: Text(Strings.GROUP_BUG),
            ),
            GroupBuyView(_homeEntity.grouponList),
            Container(
              height: 40.0,
              alignment: Alignment.center,
              child: Text(Strings.BRAND),
            ),
            BrandView(_homeEntity.brandList),
            Container(
              height: 40.0,
              alignment: Alignment.center,
              child: Text(Strings.NEW_PRODUCT),
            ),
            ProductView(_homeEntity.newGoodsList),
            Container(
              height: 40.0,
              alignment: Alignment.center,
              child: Text(Strings.PROJECT_SELECTIONS),
            ),
            ProjectSelectionView(_homeEntity.topicList),
            Container(
              height: 40.0,
              alignment: Alignment.center,
              child: Text(Strings.HOT_PRODUCT),
            ),
            ProductView(_homeEntity.hotGoodsList),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _homeEntity.floorGoodsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _floorGoodsWidget(_homeEntity.floorGoodsList[index]);
                })
          ],
        )),
        onRefresh: () async {
          _queryHomeData();
          _controller.finishRefresh();
        },
        onLoad: () async {
          _retrieveData();
          _controller.finishLoad();
        },
      ),
    );
  }

  _queryHomeData() {
    DataUtils.queryHomeData((success) {
      setState(() {
        _homeEntity = success;
      });
      _controller.finishRefresh();
    }, (error) {
      _controller.finishRefresh();
    });
  }

  Widget _floorGoodsWidget(FloorGoodsList floorGoods) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 40.0,
            alignment: Alignment.center,
            child: Text(floorGoods.name),
          ),
          ProductView(floorGoods.goodsList),
        ],
      ),
    );
  }

  void _retrieveData() {
    //上拉加载新的数据
    _mPage++;
    Future.delayed(Duration(seconds: 2)).then((e) {
      for (int i = 0; i < 5; i++) {
        _items.insert(_items.length, "这是新加载的第${_items.length}条数据");
      }
      setState(() {});
      _controller.finishLoad();
    });
  }
}
