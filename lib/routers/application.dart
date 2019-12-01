import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play/model/widget.dart';
import 'package:flutter_play/utils/shared_preferences.dart';


enum ENV {
  PRODUCTION,
  DEV,
}
class Application {
  /// 通过Application设计环境变量
  static ENV env = ENV.DEV;

  static Router router;
  static TabController controller;
  static SpUtil sharePeference;
  static CategoryComponent widgetTree;//包含本地资源的视图
  static bool pageIsOpen = false;


  /// 所有获取配置的唯一入口
  Map<String, String> get config {
      if (Application.env == ENV.PRODUCTION) {
        return {};
      }
      if (Application.env == ENV.DEV) {
        return {};
      }
      return {};
  }

}
