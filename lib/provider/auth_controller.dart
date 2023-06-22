import 'package:film_admin/data/model/allUserModel.dart';
import 'package:film_admin/data/model/userModel.dart';
import 'package:film_admin/data/repository/authRepo.dart';
import 'package:film_admin/screen/Auth/profile.dart';
import 'package:film_admin/screen/Home.dart';
import 'package:film_admin/screen/welcome.dart';
import 'package:film_admin/util/next_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../util/app_constants.dart';


class AuthController extends GetxController implements GetxService {
  final AuthReopsitory authRepo;

  final SharedPreferences sharedPreferences;

  AuthController({required this.authRepo, required this.sharedPreferences});

  @override
  void onInit() {
    super.onInit();
  }

  UserModel? _usersModel;
  AllUserModel? _allUserModel;




  //get
  AllUserModel? get allUserModel => _allUserModel;
  UserModel? get UsersModel => _usersModel;
  bool _isTypingCompleted = false;
  bool get isTypingCompleted => _isTypingCompleted;
  setisTypingComplated(bool isCompleted) {
    _isTypingCompleted = isCompleted;
    update();
  }

  Future register({String? password, String? email, String? name}) async {
    try {
      var response = await authRepo.register(password: password, email: email, name: name);
      if (response.statusCode == 200) {
        var body = response.body;
        print(response.statusCode);
        Map map = response.body;
        String token = map['token'];
        if (token != null && token.isNotEmpty) {
          await authRepo.saveToken(token: token);
          await sharedPreferences.setString(AppConstants.TOKEN, token);
          await authRepo.getToken().then((value) {
            print("token_sigup: $token");
          });
        }
        return "OK";
      } else {
        return response.body['message'];
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future login({String? email, String? password}) async {
    try {
      var response = await authRepo.login(email: email, password: password);
      if (response.statusCode == 200) {
        var body = response.body;
        print('111111 ${response.statusCode}');
        String token = '';
        Map map = response.body;
        token = map['token'];
        if (token != null && token.isNotEmpty) {
          await authRepo.saveToken(token: token);
          await sharedPreferences.setString(AppConstants.TOKEN, token);
          await authRepo.getToken().then((value) async {
            print("token_login: $token");

            await Get.find<AuthController>().UserInfo().then((value) => {
              print('login ${value}')
            });
            nextScreenReplace(Get.context, homeScreen(userModel: _usersModel,));
          });
        }
        return "OK";
        update();
      }
      else {
        return "ERROR";
      }
    } catch (e) {
      throw e.toString();
    }
  }


  Future checkVersion() async {
    try {
      var response = await authRepo.checkVersion();
      if (response.statusCode == 201 ) {
        if (response.body['appversion']['version'] == AppConstants.APP_VERSION){

        }else{
          Get.snackbar('update!', 'please update to last version');
        }

        return true;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future UserInfo() async
  {
    try {
      var response = await authRepo.getUserInfo();
      if (response.statusCode == 200) {
        var body = response.body;
        print('222220 ${response.statusCode}');
        return "OK";
      }
    }
    catch (e) {
      throw e.toString();
    }
  }

  Future logout (String? token) async
  {
    try {
      var response = await authRepo.logout(token);
      if (response.statusCode == 200) {
        var body = response.body;
        print('logout ${response.statusCode}');
       nextScreenReplace(Get.context, welcomeScreen());
        return "OK";
      }
    }
    catch (e) {
      throw e.toString();
    }
  }

  Future GetUserInfo() async
  {
    try {
      var response = await authRepo.getUserInfo();
      if (response.statusCode == 201) {
        var body = response.body;
        print(response.statusCode);
        _usersModel = null;
        _usersModel = UserModel.fromJson(body);
        print('name from ${_usersModel!.user!.name}');
        print('oooo ${response.statusCode}');

        return "OK";
      }
      else {
        return "500";
      }
    }
    catch (e) {
      throw e.toString();
    }
  }

  Future allUser()async {
    try {
      var response = await authRepo.allUser();
      if (response.statusCode == 201) {
        var body = response.body;
        _allUserModel = null;
        _allUserModel = AllUserModel.fromJson(body);
        print('all user ${_allUserModel!.message}');

        print(response.statusCode);
        return "OK";
      }
    }
    catch (e) {
      throw e.toString();
    }
  }

  Future deleteAccount() async
  {
    try {
      var response = await authRepo.deleteAccount();
      if (response.statusCode == 201) {
        var body = response.body;
        print(response.statusCode);
        return "OK";
      }
    }
    catch (e) {
      throw e.toString();
    }
  }

  Future updateProfile(XFile? avatar) async
  {
    try {
      var response = await authRepo.avatar(avatar);
      if (response.statusCode == 201) {
        var body = response.body;
        await GetUserInfo();
        nextScreen(Get.context, profileScreen());
        print(response.statusCode);



        update();
        return "OK";
      }
    }
    catch (e) {
      throw e.toString();
    }
  }


}