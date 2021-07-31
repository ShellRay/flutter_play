import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play/routers/application.dart';
import 'package:flutter_play/routers/routers.dart';
import 'package:flutter_play/utils/fluro_convert_utils.dart';

class NavigatorUtils {
  static goMallMainPage(BuildContext context) {
    Application.router.navigateTo(context, Routes.home,
        transition: TransitionType.inFromRight, replace: true);
  }

  // static goCategoryGoodsListPage(
  //     BuildContext context, String categoryName, int categoryId) {
  //   var categoryNameText = StringUtils.encode(categoryName);

  //   Application.router.navigateTo(
  //       context,
  //       Routes.categoryGoodsList +
  //           "?categoryName=$categoryNameText&categoryId=$categoryId",
  //       transition: TransitionType.inFromRight);
  // }

  // static goRegister(BuildContext context) {
  //   Application.router.navigateTo(context, Routes.register,
  //       transition: TransitionType.inFromRight);
  // }

  // static goLogin(BuildContext context) {
  //   Application.router.navigateTo(context, Routes.login,
  //       transition: TransitionType.inFromRight);
  // }

  // static goGoodsDetails(BuildContext context, int goodsId) {
  //   Application.router.navigateTo(
  //       context, Routes.goodsDetail + "?goodsId=$goodsId",
  //       transition: TransitionType.inFromRight);
  // }

  // static popRegister(BuildContext context) {
  //   Application.router.pop(context);
  // }

  // static goFillInOrder(BuildContext context,int cartId) {
  //   Application.router.navigateTo(context, Routes.fillInOrder+"?cartId=$cartId",
  //       transition: TransitionType.inFromRight);
  // }

  // static Future goAddress(BuildContext context) async {
  //   return await Application.router.navigateTo(context, Routes.address,
  //       transition: TransitionType.inFromRight);
  // }

  // static Future goAddressEdit(BuildContext context, int addressId) {
  //   return Application.router.navigateTo(
  //       context, Routes.addressEdit + "?addressId=$addressId",
  //       transition: TransitionType.inFromRight);
  // }

  // static goFeedback(BuildContext context) {
  //   Application.router.navigateTo(context, Routes.feedback,
  //       transition: TransitionType.inFromRight);
  // }

  // static goCoupon(BuildContext context) {
  //   Application.router.navigateTo(context, Routes.mineCoupon,
  //       transition: TransitionType.inFromRight);
  // }

  // static goFootprint(BuildContext context) {
  //   Application.router.navigateTo(context, Routes.mineFootprint,
  //       transition: TransitionType.inFromRight);
  // }

  // static goCollect(BuildContext context) {
  //   Application.router.navigateTo(context, Routes.mineCollect,
  //       transition: TransitionType.inFromRight);
  // }

  // static goAboutUs(BuildContext context) {
  //   Application.router.navigateTo(context, Routes.aboutUs,
  //       transition: TransitionType.inFromRight);
  // }

  // static submitOrderSuccessPop(BuildContext context) {
  //   Application.router.navigateTo(context, Routes.home,
  //       clearStack: true, transition: TransitionType.inFromRight);
  // }

  // static goOrder(BuildContext context) {
  //   Application.router.navigateTo(context, Routes.mineOrder,
  //       transition: TransitionType.inFromRight);
  // }

  // static Future goOrderDetail(BuildContext context, int orderId, String token) {
  //   return Application.router.navigateTo(
  //       context, Routes.mineOrderDetail + "?orderId=$orderId&token=$token",
  //       transition: TransitionType.inFromRight);
  // }

  // static goSearchGoods(BuildContext context) {
  //   Application.router.navigateTo(context, Routes.searchGoods,
  //       transition: TransitionType.inFromRight);
  // }

  // static goProjectSelectionDetail(BuildContext context, int id, bool replace) {
  //   Application.router.navigateTo(
  //       context, Routes.projectSelectionDetail + "?id=$id",
  //       replace: replace, transition: TransitionType.inFromRight);
  // }

  static goWebView(BuildContext context, String title, String url) {
    var titleName = FluroConvertUtil.fluroCnParamsEncode(title);
    var urlEncode = FluroConvertUtil.fluroCnParamsEncode(url);
    // Application.router.navigateTo(
    //        context, Routes.webView + "?title=${Uri.encodeComponent(title)}&url=${Uri.encodeComponent(url)}",
    //        transition: TransitionType.inFromRight);
    Application.router.navigateTo(
        context, Routes.webView + "?title=$titleName&&url=$urlEncode",
        transition: TransitionType.inFromRight);
  }

  // static goBrandDetail(BuildContext context, String titleName, int id) {
  //   var title = FluroConvertUtil.fluroCnParamsEncode(titleName);
  //   Application.router.navigateTo(
  //       context, Routes.brandDetail + "?titleName=$title&id=$id",
  //       transition: TransitionType.inFromRight);
  // }
}
