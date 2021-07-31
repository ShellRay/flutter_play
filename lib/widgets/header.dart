import 'package:flutter/material.dart';
import 'package:flutter_play/components/search_input.dart';

const double SEARCH_MARGIN_LEFT = 15.0; // 搜索栏left居左位置

const double CITY_MARGIN_RIGHT = 15.0; // 搜索栏right居左位置

typedef OnOffsetChangeListener = Function(double percent);

class Header extends StatefulWidget {
  Header({
    Key key,
    this.offset: 0.0, // 外部驱动的偏移属性
    this.cityName,
    this.onOffsetChangeListener,
  }) : super(key: key);

  final double offset;
  final String cityName;
  final OnOffsetChangeListener onOffsetChangeListener;

  double searchLeft = SEARCH_MARGIN_LEFT;
  double searchLeftEnd = SEARCH_MARGIN_LEFT;

  @override
  State<StatefulWidget> createState() => HeaderState();
}

class HeaderState extends State<Header> with TickerProviderStateMixin {
  AnimationController searchBgColorAnimController;
  Animation<Color> searchBgColor;

  // 偏移值驱动动画属性
  drive(offset) {
    // 过渡比例
    double percent = offset / 80.0 > 1.0 ? 1.0 : offset / 80.0;
    // 偏移比例回调
    if (widget.onOffsetChangeListener != null) {
      widget.onOffsetChangeListener(percent);
    }
    // 搜索栏居左吸顶后的位置
    widget.searchLeftEnd = SEARCH_MARGIN_LEFT +
        (widget.cityName ?? '').length * 22 +
        CITY_MARGIN_RIGHT;
    // 搜索栏居左位置
    widget.searchLeft = (SEARCH_MARGIN_LEFT +
        (widget.searchLeftEnd - SEARCH_MARGIN_LEFT) * percent);
    // 背景颜色控制
    searchBgColorAnimController.value = percent;
  }

  @override
  void didUpdateWidget(Header oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.offset != oldWidget.offset) {
      drive(widget.offset);
    }
  }

  @override
  void initState() {
    super.initState();
    searchBgColorAnimController = new AnimationController(vsync: this);
    searchBgColor = ColorTween(
      begin: Color(0xffffffff),
      end: Color(0xffDADDE1),
    ).animate(
      CurvedAnimation(
        parent: searchBgColorAnimController,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        // 搜索栏
        // SearchInput(
        //   // left: widget.searchLeft,
        //   // bgColor: searchBgColor.value,

        // ),
        new SearchInput((value) async {
          if (value != '') {
            print('value ::: $value');
            // List<WidgetPoint> list = await widgetControl.search(value);

          } else {
            return null;
          }
        }, (value) {}, () {}),
      ],
    );
  }
}
