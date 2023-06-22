
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// import '../view/screen/chatScreen.dart';

// class Storage {
//   final storage = FlutterSecureStorage();
//   Future<void> saveChat({required List<MessageData> msgList}) async {
//     await storage.deleteAll();
//     await storage.write(key: 'msg', value: msgList.toString());
//   }

//   Future<String?>  getChat()async{
//     String? msg = await storage.read(key: 'msg');
//     return msg;
//   }
// }