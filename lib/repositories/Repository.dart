import 'package:flutter/material.dart';
import 'package:real_washer/providers/ApiProvider.dart';

class Repository {
  ApiProvider apiProvider = ApiProvider();
  Future<String> login(var userContactNumber, var userPassword) =>
      apiProvider.login(userContactNumber, userPassword);

  Future<String> signup(var userName, var userEmail, var userContactNumber,
           var userPassword) =>
      apiProvider.signup(
          userName, userEmail, userContactNumber,  userPassword);
}
