// import 'dart:io';
// import 'package:accordapp/data/model/body/device_body.dart';
// import 'package:accordapp/provider/auth_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get/get.dart';

// class DeviceCheckHelper {
//   final SharedPreferences? sharedPreferences;
//   DeviceCheckHelper({this.sharedPreferences});

//   static Future<dynamic> getDeviceInfo() async {
//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     String model = '';
//     String deviceID = '';
//     if (Platform.isAndroid) {
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       deviceID = androidInfo.androidId!;
//       print('Running on ${androidInfo.model}');
//       model = androidInfo.model!;
//       print('Deivce ID ${androidInfo.androidId}');
//       // sharedPreferences.setString(key, value)
//       return androidInfo;
//     } else if (Platform.isIOS) {
//       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//       deviceID = iosInfo.utsname.sysname!;
//       switch (iosInfo.utsname.machine) {
//         case "iPhone14,5":
//           print("iPhone 13");
//           model = "iPhone 13";
//           break;
//         case "iPhone14,4":
//           print("iPhone 13 Pro");
//           model = 'iPhone 13 Pro';
//           break;
//         case "iPhone14,2":
//           print("iPhone 13 Pro Max");
//           model = 'iPhone 13 Pro Max';
//           break;
//         case "iPhone14,3":
//           print("iPhone 13 Mini");
//           model = "iPhone 13 Mini";
//           break;
//         case "iPhone13,4":
//           print("iPhone 12 Pro Max");
//           model = "iPhone 12 Pro Max";
//           break;
//         case "iPhone13,3":
//           print("iPhone 12 Pro");
//           model = "iPhone 12 Pro";
//           break;
//         case "iPhone13,2":
//           print("iPhone 12");
//           model = "iPhone 12";
//           break;
//         case "iPhone13,1":
//           print("iPhone 12 Mini");
//           model = "iPhone 12 Mini";
//           break;
//         case "iPhone12,8":
//           print("iPhone SE 2");
//           model = "iPhone SE 2";
//           break;
//         case "iPhone12,5":
//           print("iPhone 11 Pro Max");
//           model = "iPhone 11 Pro Max";
//           break;
//         case "iPhone12,3":
//           print("iPhone 11 Pro");
//           model = "iPhone 11 Pro";
//           break;
//         case "iPhone12,1":
//           print("iPhone 11");
//           model = "iPhone 11";
//           break;
//         case "iPhone11,8":
//           print("iPhone XR");
//           model = "iPhone XR";
//           break;
//         case "iPhone11,6":
//           print("iPhone XS Max");
//           model = "iPhone XS Max";
//           break;
//         case "iPhone11,4":
//           print("iPhone XS Max");
//           model = "iPhone XS Max";
//           break;
//         case "iPhone11,2":
//           print("iPhone XS");
//           model = "iPhone XS";
//           break;
//         case "iPhone10,6":
//           print("iPhone X");
//           model = "iPhone X";
//           break;
//         case "iPhone10,5":
//           print("iPhone 8 Plus");
//           model = "iPhone 8 Plus";
//           break;
//         case "iPhone10,4":
//           print("iPhone 8");
//           model = "iPhone 8";
//           break;
//         case "iPhone10,3":
//           print("iPhone X");
//           model = "iPhone X";
//           break;
//         case "iPhone10,2":
//           print("iPhone 8 Plus");
//           model = "iPhone 8 Plus";
//           break;
//         case "iPhone10,1":
//           print("iPhone 8");
//           model = "iPhone 8";
//           break;
//         case "iPhone9,4":
//           print("iPhone 7 Plus");
//           model = "iPhone 7 Plus";
//           break;
//         case "iPhone9,3":
//           print("iPhone 7");
//           model = "iPhone 7";
//           break;
//         case "iPhone9,2":
//           print("iPhone 7 Plus");
//           model = "iPhone 7 Plus";
//           break;
//         case "iPhone9,1":
//           print("iPhone 7");
//           model = "iPhone 7";
//           break;
//         case "iPhone8,4":
//           print("iPhone SE");
//           model = "iPhone SE";
//           break;
//         case "iPhone8,2":
//           print("iPhone 6S Plus");
//           model = "iPhone 6S Plus";
//           break;
//         case "iPhone8,1":
//           print("iPhone 6S");
//           model = "iPhone 6S";
//           break;
//         case "iPhone7,2":
//           print("iPhone 6");
//           model = "iPhone 6";
//           break;
//         case "iPhone7,1":
//           print("iPhone 6 Plus");
//           model = "iPhone 6 Plus";
//           break;
//         case "iPhone6,2":
//           print("iPhone 5S");
//           model = "iPhone 5S";
//           break;
//         case "iPhone6,1":
//           print("iPhone 5S");
//           model = "iPhone 5S";
//           break;
//         case "iPhone5,4":
//           print("iPhone 5C");
//           model = "iPhone 5C";
//           break;
//         case "iPhone5,3":
//           print("iPhone 5C");
//           model = "iPhone 5C";
//           break;
//         case "iPhone5,2":
//           print("iPhone 5");
//           model = "iPhone 5";
//           break;
//         case "iPhone5,1":
//           print("iPhone 5");
//           model = "iPhone 5";
//           break;
//         case "iPhone4,1":
//           print("iPhone 4S");
//           model = "iPhone 4S";
//           break;
//         case "iPhone3,3":
//           print("iPhone 4");
//           model = "iPhone 4";
//           break;
//         case "iPhone3,2":
//           print("iPhone 4");
//           model = "iPhone 4";
//           break;
//         case "iPhone3,1":
//           print("iPhone 4");
//           model = "iPhone 4";
//           break;
//         case "iPhone2,1":
//           print("iPhone 3GS");
//           model = "iPhone 3GS";
//           break;
//         case "iPhone1,2":
//           print("iPhone 3G");
//           model = "iPhone 3G";
//           break;
//         case "iPhone1,1":
//           print("iPhone");
//           model = "iPhone";
//           break;
//         default:
//           print("Unknown");
//           model = "Unknown";
//       }
//       return model;
//     }
//     String? deviceToken = await FirebaseMessaging.instance.getToken();
//     var response = await http.get(Uri.parse('https://api.ipify.org'));
//     if (response.statusCode == 200) {
//       print('IP Address: ${response.body}');
//       return response.body;
//     } else {
//       // throw Exception('Failed to get network IP');
//     }
//     Get.find<AuthController>().userDeviceInfo(DeviceInfo(
//         deviceName: model,
//         deviceToken: deviceID,
//         fcmToken: deviceToken,
//         ipAddress: response.body));
//   }

//   static Future<String> getNetworkIP() async {
//     var response = await http.get(Uri.parse('https://api.ipify.org'));
//     if (response.statusCode == 200) {
//       print('IP Address: ${response.body}');
//       return response.body;
//     } else {
//       throw Exception('Failed to get network IP');
//     }
//   }

//   static Future<String> getDeviceToken() async {
//     String? deviceToken = await FirebaseMessaging.instance.getToken();
//     print('Device Token: $deviceToken');
//     return deviceToken!;
//   }
// }
