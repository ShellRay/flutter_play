import 'package:flutter/cupertino.dart';

/**
 * 发现 - 附近
 * */
class DiscoverNearlyPage extends StatefulWidget {
  DiscoverNearlyPage();

  _DiscoverNearlyPage createState() => _DiscoverNearlyPage();
}

class _DiscoverNearlyPage extends State<DiscoverNearlyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
      itemCount: 1,
      itemBuilder: (context, i) {
        // 最后一个单词对
        if (i == 0) {
          return _buildHeaderItem();
        } else {}
      },
    );
  }

  Widget _buildHeaderItem() {
    return new Column(
      children: <Widget>[
        new Row(),
        new Row(),
        new Row(),
        new Row(),
      ],
    );
  }
}
