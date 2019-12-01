import 'package:flutter/material.dart';
import 'package:flutter_play/components/widget_item_container.dart';
import 'package:flutter_play/resouces/widget_name_to_icon.dart';

import '../model/widget.dart';

class CateCard extends StatefulWidget {
  final CategoryComponent category;
  CateCard({@required this.category});
  @override
  _CateCardState createState() => _CateCardState();
}

class _CateCardState extends State<CateCard> {
  // 一级菜单目录下的二级Cat集合
  List<CommonItem> _firstChildList;

  @override
  void initState() {
    super.initState();
    _firstChildList = widget.category.children;
  }



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    widget.category.name = widget.category.name.replaceFirst(
        //首字母转为大写
        widget.category.name.substring(0, 1),
        widget.category.name.substring(0, 1).toUpperCase());
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: screenWidth - 20,
            margin: const EdgeInsets.only(top: 30.0, bottom: 0.0),
            decoration: BoxDecoration(//每个布局的背景
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              children: <Widget>[
                ///每个布局的标题的文字
                Container(
                  width: screenWidth - 20,
                  padding: const EdgeInsets.only(left: 65.0, top: 3.0),
                  height: 30.0,
                  child: Text(
                    widget.category.name,
                    style: TextStyle(
                      color: Color(0xff000000),//Theme.of(context).primaryColor,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                _buildWidgetContainer(),
              ],
            ),
          ),
          Positioned(///每个布局的标题部分图片
            left: 0.0,
            top: 0.0,
            child: Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  height: 46.0,
                  width: 46.0,
                  child: Icon(
                    WidgetName2Icon.icons[widget.category.name],
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          )
        ],

      ),
    );
  }

  Widget _buildWidgetContainer() {
    if (this._firstChildList.length == 0) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/p1.png'),
          alignment: Alignment.bottomRight
        ),
      ),
      child: WidgetItemContainer(
        commonItems: this._firstChildList,
        columnCount: 3
      ),
    );
  }
}
