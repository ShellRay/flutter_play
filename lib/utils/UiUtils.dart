


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiUtils{

  static void flutterToastNormal(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 14.0
    );

  }

  static Tooltip flutterToolTip(String msg,bool preferBelow) {

    return Tooltip(
        message: msg,
        preferBelow:false,  //设置false就是在上面弹
//        child: Icon(
//          Icons.delete,
//          size: 50.0,
//        )
 );

  }


}