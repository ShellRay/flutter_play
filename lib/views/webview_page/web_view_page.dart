

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_play/event/event_bus.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget{
  final String url;
  final String title;

  WebViewPage( this.url,this.title);

  _WebViewPageState createState() => _WebViewPageState();

}

class _WebViewPageState extends State<WebViewPage>{

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    flutterWebviewPlugin.onUrlChanged.listen((String url) {
//      print('url change:$url');
//      if (url.indexOf('loginSuccess') > -1) {
//        String urlQuery = url.substring(url.indexOf('?') + 1);
//        String loginName, token;
//        List<String> queryList = urlQuery.split('&');
//        for (int i = 0; i < queryList.length; i++) {
//          String queryNote = queryList[i];
//          int eqIndex = queryNote.indexOf('=');
//          if (queryNote.substring(0, eqIndex) == 'loginName') {
//            loginName = queryNote.substring(eqIndex + 1);
//          }
//          if (queryNote.substring(0, eqIndex) == 'accessToken') {
//            token = queryNote.substring(eqIndex + 1);
//          }
//        }
//        if (ApplicationEvent.event != null) {
//          ApplicationEvent.event
//              .fire(UserGithubOAuthEvent(loginName, token, true));
//        }
//        print('ready close');
//
//        flutterWebviewPlugin.close();
//        // 验证成功
//      } else if (url.indexOf('${Api.BASE_URL}loginFail') == 0) {
//        // 验证失败
//        if (ApplicationEvent.event != null) {
//          ApplicationEvent.event.fire(UserGithubOAuthEvent('', '', true));
//        }
//        flutterWebviewPlugin.close();
//      }
//    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WebviewScaffold(
        url: widget.url,
        withZoom: false,
        withLocalStorage: true,
        withJavascript: true,
      ),);
  }
}

