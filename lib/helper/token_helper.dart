
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../provider/auth_controller.dart';
import '../util/app_constants.dart';
class TokenHelper{
  final storage = FlutterSecureStorage();
  final SharedPreferences sharedPreferences = Get.find();
  Future<void> saveToken({required String token}) async {
    final SharedPreferences sharedPreferences = Get.find();
    await storage.deleteAll();
    await sharedPreferences.remove(AppConstants.TOKEN);
    await storage.write(key: 'token', value: token);
    await sharedPreferences.setString(AppConstants.TOKEN, token);
    // print(sharedPreferences.get(AppConstants.TOKEN));
  }

  Future<void> saveUUID({required String uuid}) async {
    // final SharedPreferences sharedPreferences = Get.find();
    await storage.deleteAll();
    // await sharedPreferences.remove(AppConstants.TOKEN);
    await storage.write(key: 'uuid', value: uuid);
  }

  static List<String> convertStringtoListString({required String data}) {
    return json.decode(data);
  }

  Future<String?> getToken() async {
    String? token = await storage.read(key: 'token');
    if (token != null) {
      await sharedPreferences.setString(AppConstants.TOKEN, token);
      // if (token != Get.find<AuthController>().UsersModel!.user!.token){
      //   return 'Not Match';
      // }
      return token;
    } else
      return null;
  }

  Future<String?> getUUID() async {
    String? uuid = await storage.read(key: 'uuid');
    if (uuid != null) {
      print(uuid);
      return uuid;
    } else
      return null;
  }

  Future<void> removeToken() async {
    await storage.deleteAll();
    await sharedPreferences.remove(AppConstants.TOKEN);
    return;
  }
}