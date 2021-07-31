import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingView extends StatefulWidget {
  @override
  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitCircle(
          size: ScreenUtil.instance.setWidth(100.0),
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
