
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{

  HomePage();

  _HomePage createState()=> _HomePage();
}

class _HomePage extends State<HomePage>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
        child:Text("首页")
    );
  }
}