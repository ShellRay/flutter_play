import 'package:flutter/material.dart';

class BannerItem {
  String itemImagePath;
  Widget itemText;

  static BannerItem defaultBannerItem(String image, String text) {
    BannerItem item = new BannerItem();
    item.itemImagePath = image;
    Text textWidget = new Text(
      text,
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: Colors.black, fontSize: 14.0, decoration: TextDecoration.none),
    );

    item.itemText = textWidget;

    return item;
  }
}