import 'package:film_admin/data/model/appModel.dart';
import 'package:film_admin/data/model/body/phone_signup_body.dart';
import 'package:film_admin/data/model/login_model.dart';
import 'package:film_admin/data/model/register_model.dart';
import 'package:film_admin/util/app_constants.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/token_helper.dart';
import '../api/api_client.dart';
import '../model/userModel.dart';

class AuthReopsitory {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  TokenHelper _storage = TokenHelper();
  String? token;
  AuthReopsitory({required this.dioClient, required this.sharedPreferences});
  Future<void> saveToken({required String token}) async {
    await sharedPreferences.setString(AppConstants.TOKEN, token);
    await _storage.saveToken(token: token);
  }
  Future<String?> getToken() async {
    await sharedPreferences.getString(AppConstants.TOKEN);
    return await _storage.getToken();
  }

  Future register({String? password, String? email, String? name}) async {
    try{
      Response response = await dioClient.postData(
          AppConstants.REGISTER, {"password": password, "email": email, "name": name, "password_confirmation" : password},
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });
      return response;
    }catch(e){
      throw e.toString();

    }

  }

  Future checkVersion() async {
    try{
      Response response = await dioClient.getData(
          AppConstants.CHECK_VERSION,headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      return response;
    }catch(e){
      throw e.toString();

    }

  }

  Future avatar(XFile? avatar,) async {
    try{
      Response response = await dioClient.postMultipartData(
          AppConstants.AVATAR,{},[MultipartBody('avatar', avatar!),],
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });

      return response;
    }catch(e){
      throw e.toString();

    }

  }


  Future login ({String? password, String? email}) async {

    try{

      Response response = await dioClient.postData(
          AppConstants.LOGIN, {"password": password, "email": email},
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });
      return response;
    }catch(e){
      throw e.toString();

    }

  }

  Future logout (String? token) async
  {
    TokenHelper tokenHelper = TokenHelper();
    token = await tokenHelper.getToken();
    try{
      final response = await dioClient.postData(AppConstants.LOGOUT,{"token": token},headers:
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      return response;
    }
    catch(e){
      throw e.toString();
    }

  }

  Future<Response> getUserInfo() async {
    TokenHelper tokenHelper = TokenHelper();
    token = await tokenHelper.getToken();
    try {
      final response = await dioClient.getData(AppConstants.USERINFO,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      return response;
    } catch (e) {
      // return ApiResponse.withError(ApiErrorHandler.getMessage(e));
      throw e.toString();
    }
  }

  Future<Response> deleteAccount() async
  {
    TokenHelper tokenHelper = TokenHelper();
    token = await tokenHelper.getToken();
    try{
      final response = await dioClient.deleteData(AppConstants.DELETE_ACCOUNT,headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      return response;
    }catch (e) {
      // return ApiResponse.withError(ApiErrorHandler.getMessage(e));
      throw e.toString();
    }
  }


  Future<Response> allUser() async
  {
    TokenHelper tokenHelper = TokenHelper();
    token = await tokenHelper.getToken();
    try{
      final response = await dioClient.getData(AppConstants.ALL_USER,headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }) ;
      return response;

    }
    catch(e){
      throw e.toString();
    }


  }


}