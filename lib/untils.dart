import 'package:flutter/material.dart';
import 'package:fluttertest/sku_api.dart';
import 'package:fluttertest/sku_response.dart';
import 'package:fluttertoast/fluttertoast.dart';

loginGuest() async{
  SkuResponse response = await SkuApi().loginWithGuest() as SkuResponse;
  Fluttertoast.showToast(
      msg: response.error.message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}

register(String userName,String password,String confirmPassword) async {
  SkuResponse skuResponse = await SkuApi().registerUser(
      userName
      , password) as SkuResponse;
  // Toast.show(skuResponse.error.message, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
  Fluttertoast.showToast(
      msg: skuResponse.error.message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

loginNomal(String userName, String password) async{
  SkuResponse response = await SkuApi().loginWithNomal(userName, password) as SkuResponse;

  Fluttertoast.showToast(
      msg: response.error.message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
