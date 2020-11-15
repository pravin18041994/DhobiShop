import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:real_washer/utilities/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  ApiProvider apiProvider = ApiProvider();

  Future<String> login(userContactNumber, userPassword) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    http.Response response = await http.post(Constants.BASE_URL + "",
        body: {'contact_no': userContactNumber, 'password': userPassword},
        headers: {});
    print(response.body);
    if (response.statusCode == 200) {
      var decRes = json.decode(response.body);
      if (decRes['state'] == 'success') {
        var storage = FlutterSecureStorage();
        await storage.write(key: "token", value: decRes['token']);
      } else {
        return 'fail';
      }
    } else {
      throw Exception('Cannot perform the operation');
    }
  }

  Future<String> signup(
      userName, userEmail, userContactNumber, userPassword) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    http.Response response = await http.post(Constants.BASE_URL + "", body: {
      'userName': userName,
      'userEmail': userEmail,
      'userContactNumber': userContactNumber,
      'userPassword': userPassword
    }, headers: {});
    print(response.body);
    if (response.statusCode == 200) {
      var decRes = json.decode(response.body);
      if (decRes['state'] == 'success') {
        var storage = FlutterSecureStorage();
        await storage.write(key: "token", value: decRes['token']);
      } else {
        return 'fail';
      }
    } else {
      throw Exception('Cannot perform the operation');
    }
  }
}
