import 'package:film_admin/data/model/actorModel.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../api/api_client.dart';

class ActorRepository {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  String? token;
  ActorRepository({required this.dioClient, required this.sharedPreferences});



  Future<Response> getActor() async {
    try {
      Response response = await dioClient.getData(
          AppConstants.GET_ACTOR,
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
  Future<Response> getActorById(String id) async {
    try {
      Response response = await dioClient.getData(
        AppConstants.GET_ACTOR+ "/$id",
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
  
  // Future  CreateActor(ActorModelList actor) async{
  //   try{
  //     Response response = await dioClient.postMultipartData(
  //       AppConstants.CREATE_ACTOR,[MultipartBody(''),]
  //     );
  //   }
  //   catch(e){
  //     throw e.toString();
  //   }
  // }


}