import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_play/views/login_page.dart';
import 'package:flutter_play/views/webview_page/web_view_page.dart';


// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//    return new AppPage(UserInformation(id: 0));
  },
);

var collectionFullHandler = new Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    bool hasLogined = params['hasLogin']?.first == 'true';
//    return CollectionFullPage(hasLogined: hasLogined);
  }
);

var collectionHandler = new Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    bool hasLogined = params['hasLogin']?.first == 'true';
//    return CollectionPage(hasLogined: hasLogined);
  }
);

var categoryHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String ids = params["ids"]?.first;

//    return new CategoryHome(ids);
  },
);

var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      return new WidgetNotFound();
    });
var loginPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return LoginPage();
    });

var fullScreenCodeDialog = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String path = params['filePath']?.first;
//      return new FullScreenCodeDialog(
//        filePath: path,
//      );
    });


var githubCodeDialog = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String path = params['remotePath']?.first;
//      return new FullScreenCodeDialog(
//        remoteFilePath: path,
//      );
    });

var webViewPageHand = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  return new WebViewPage(url, title);
});


var standardPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String id = params['id']?.first;
//    return StandardView(id: id);
  }
);


var issuesMessageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      return IssuesMessagePage();
    });
