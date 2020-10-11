import 'package:flutter/cupertino.dart';
import 'package:flutter_play/bean/recomend_item_bean%20copy.dart';

import 'Item.dart';

/**
 * 发现 - 直播
 * */
class DiscoverLivePage extends StatefulWidget {
  DiscoverLivePage();

  _DiscoverLivePage createState() => _DiscoverLivePage();
}

class _DiscoverLivePage extends State<DiscoverLivePage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(10),
        ),
      ]),
    );
  }
}
