import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_play/model/search_history.dart';
import 'package:flutter_play/routers/application.dart';
import 'package:flutter_play/routers/routers.dart';
import 'package:flutter_play/utils/data_utils.dart';
import 'package:flutter_play/utils/provider.dart';
import 'package:flutter_play/utils/shared_preferences.dart';
import 'package:flutter_play/views/login_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'model/widget.dart';
import 'standard_pages/index.dart';

SpUtil sp;
var db;

class MyApp extends StatefulWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    // 这里设置项目环境
    Application.router = router;
  }

  _MyAppState createState() => _MyAppState();
}

void main() async {
  //在runApp()之前如果访问二进制文件或者初始化插件，需要先调用WidgetsFlutterBinding.ensureInitialized() 。
  WidgetsFlutterBinding.ensureInitialized();
  final provider = new Provider();
  await provider.init(true);
  sp = await SpUtil.getInstance();
  new SearchHistoryList(sp);

  await DataUtils.getWidgetTreeList().then((List json) {
    if (json != null) {
      List data =
          WidgetTree.insertDevPagesToList(json, StandardPages().getLocalList());
      Application.widgetTree = WidgetTree.buildWidgetTree(data);
      print("Application.widgetTree>>>> ${Application.widgetTree}");
    }
  });
  db = Provider.db;

  runApp(MyApp());
}

class _MyAppState extends State<MyApp> {
  bool _hasLogin = false;
  bool _isLoading = true;

//  UserInformation _userInfo;
  bool isConnected = false;
  String registrationId;
  List notificationList = [];
  int themeColor = 0xFF45b97c;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          body:
              showWelcomePage()), //MyHomePage(title: 'Flutter Demo Home Page'),// 应用程序默认路由的小部件,用来定义当前应用打开的时候，所显示的界面

      debugShowCheckedModeBanner: true, //是否展示debug模式
      onGenerateRoute: Application.router.generator,
//      navigatorObservers: <NavigatorObserver>[Analytics.observer],
    );
  }

  showWelcomePage() {
    return LoginPage();

//    return Container(
//      color: Color(this.themeColor),
//      child: Center(
//        加载中图
//        有许多例子SpinKit+ Wave CubeGrid ChasingDots FoldingCube
//        child: SpinKitWave(color: Colors.white,size: 70),
//      ),
//
//    );

    const timeout = const Duration(seconds: 5);
    Timer(timeout, () {
      //到时回调
      // 判断是否已经登录
      if (_hasLogin) {
//        return AppPage(_userInfo);
      } else {
        return LoginPage();
      }
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
