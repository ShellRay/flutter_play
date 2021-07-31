import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_play/model/banner_Item.dart';

const MAX_COUNT = 0x7fffffff;

///
/// Item的点击事件
///
typedef void OnBannerItemClick(int position, BannerItem entity);

///
/// 自定义ViewPager的每个页面显示
///
typedef Widget CustomBuild(int position, BannerItem entity);

class VirtiAutoScroollWidget extends StatefulWidget {
  final double height;
  final List<BannerItem> datas;
  int duration;
  double pointRadius;
  Color selectedColor;
  Color unSelectedColor;
  Color textBackgroundColor;
  bool isHorizontal;

  OnBannerItemClick bannerPress;
  CustomBuild build;

  VirtiAutoScroollWidget(double this.height, List<BannerItem> this.datas,
      {Key key,
      int this.duration = 5000,
      double this.pointRadius = 3.0,
      Color this.selectedColor = Colors.lightBlue,
      Color this.unSelectedColor = Colors.white,
      Color this.textBackgroundColor = const Color(0x99fffffff),
      bool this.isHorizontal = true,
      OnBannerItemClick this.bannerPress,
      CustomBuild this.build})
      : super(key: key);

  VirtiAutoScroollState createState() => new VirtiAutoScroollState();
}

class VirtiAutoScroollState extends State<VirtiAutoScroollWidget> {
  Timer timer;
  int selectedIndex = 0;
  PageController controller;

  @override
  void initState() {
    double current = widget.datas.length > 0
        ? (MAX_COUNT / 2) - ((MAX_COUNT / 2) % widget.datas.length)
        : 0.0;
    controller = PageController(initialPage: current.toInt());
    _initPageAutoScroll();
    super.initState();
  }

  _initPageAutoScroll() {
    start();
  }

  // @override
  // void didUpdateWidget(VirtiAutoScroollState oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  // }

  start() {
    stop();
    timer = Timer.periodic(Duration(milliseconds: widget.duration), (timer) {
      if (widget.datas.length > 0 &&
          controller != null &&
          controller.page != null) {
        controller.animateToPage(controller.page.toInt() + 1,
            duration: Duration(milliseconds: 300), curve: Curves.linear);
      }
    });
  }

  stop() {
    timer?.cancel();
    timer = null;
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: widget.height,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 1.0),
      child: Stack(
        children: <Widget>[
          getViewPager(),
        ],
      ),
    );
  }

  Widget getViewPager() {
    return PageView.builder(
      scrollDirection: widget.isHorizontal ? Axis.horizontal : Axis.vertical,
      itemCount: widget.datas.length > 0 ? MAX_COUNT : 0,
      controller: controller,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (widget.bannerPress != null)
              widget.bannerPress(selectedIndex, widget.datas[selectedIndex]);
          },
          child:
              // widget.build == null
              //     ? FadeInImage.memoryNetwork(
              //         placeholder: kTransparentImage,
              //         image:
              //             widget.datas[index % widget.datas.length].itemImagePath,
              //         fit: BoxFit.cover)
              //     : widget.build(
              //         index, widget.datas[index % widget.datas.length])

              new Stack(alignment: Alignment.centerLeft, children: [
            IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.only(left: 10.0),
                color: widget.textBackgroundColor,
                child: getBannerTextInfoWidget(),
              ),
            ),
          ]),
        );
      },
    );
  }

  Widget getSelectedIndexTextWidget() {
    return widget.datas.length > 0 && selectedIndex < widget.datas.length
        ? widget.datas[selectedIndex].itemText
        : Text(
            '',
          );
  }

  Widget getBannerTextInfoWidget() {
    if (widget.isHorizontal) {
      return Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, //摆放位置 前提是expanded中的widget权重占一个
        children: <Widget>[
          new Expanded(
            flex: 1, //默认一等分。类似LinearLayout中的weight=1
            child: getSelectedIndexTextWidget(),
          ),
          Expanded(
            flex: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: circle(),
            ),
          ),
        ],
      );
    } else {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          getSelectedIndexTextWidget(),
          // IntrinsicWidth(
          //   child: Row(
          //     children: circle(),
          //   ),
          // ),
        ],
      );
    }
  }

  List<Widget> circle() {
    List<Widget> circle = [];
    for (var i = 0; i < widget.datas.length; i++) {
      circle.add(Container(
        margin: EdgeInsets.all(2.0),
        width: widget.pointRadius * 2,
        height: widget.pointRadius * 2,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: selectedIndex == i
              ? widget.selectedColor
              : widget.unSelectedColor,
        ),
      ));
    }
    return circle;
  }

  onPageChanged(index) {
    selectedIndex = index % widget.datas.length;
    setState(() {});
  }
}
