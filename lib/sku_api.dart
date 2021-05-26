import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';

import 'sku_response.dart';
import 'package:http/http.dart' as http;

class SkuApi {
  var baseUrl = 'https://api.launcher.skw.vn/';
  var client = http.Client();

  Future registerUser(String userName, String password) async {
    var url = Uri.parse(baseUrl + 'user/register');
    print(url);
    final response = await client.post(
      url,
      body: jsonEncode(
          {'gameId': '1', 'userName': userName, 'password': password}),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    print(response.body);

    return skuResponseFromJson(response.body);
  }


  Future loginWithGuest() async {
    var url = Uri.parse(baseUrl + 'user/login/guest');
    print(url);

    var uuid;
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      uuid = iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      uuid = androidDeviceInfo.androidId; // unique ID on Android
    }

    final response = await client.post(
      url,
      body: jsonEncode({
        'gameId': '1',
        'guestId': DateTime.now().toString(),
        'appKey': 'Ngau nhien',
        'deviceInfo': uuid.toString()
      }),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    print(response.body);

    return skuResponseFromJson(response.body);
  }

  Future loginWithNomal(String userName, String password) async {
    var url = Uri.parse(baseUrl + 'user/login/skw');
    print(url);

    var uuid;
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      uuid = iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      uuid = androidDeviceInfo.androidId; // unique ID on Android
    }

    final response = await client.post(
      url,
      body: jsonEncode({
        'gameId': '1',
        'userName': userName,
        'password': password,
        'appKey': 'Ngau nhien',
        'deviceInfo': uuid.toString()
      }),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    print(response.body);

    return skuResponseFromJson(response.body);
  }
}
