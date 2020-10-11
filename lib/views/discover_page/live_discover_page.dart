



import 'package:flutter/cupertino.dart';

/**
 * 发现 - 发现
 * */
class DiscoverDiscoverPage extends StatefulWidget {
  DiscoverDiscoverPage();

  _DiscoverDiscoverPage createState() => _DiscoverDiscoverPage();
}

class _DiscoverDiscoverPage extends State<DiscoverDiscoverPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(

      itemCount: 1,
      itemBuilder: (context, i) {
        // 最后一个单词对
        if (i == 0) {
          return _buildHeaderItem();
        }else{

        }
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

