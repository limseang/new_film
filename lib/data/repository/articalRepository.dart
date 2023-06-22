import 'package:film_admin/data/model/artical_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../api/api_client.dart';

class ArticalRepository {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  String? token;

  ArticalRepository({required this.dioClient, required this.sharedPreferences});

  /* ARTICAL */

  Future<Response> getArticals() async {
    try {
      Response response = await dioClient.getData(
          AppConstants.ARTICALS,

      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> getSubcategory()async{
    try{
      Response response = await dioClient.getData(
          AppConstants.SUB_CATEGORY,
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> getArticalBySub(id)async{
    try{
      Response response = await dioClient.getData(
          AppConstants.ARTICAL_BY_SUB_CATEGORY + "$id",
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> getArticalById(String id) async {
    try {
      Response response = await dioClient.getData(
          AppConstants.ARTICALS+ "/$id",
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future <Response> getCategory() async{
    try{
      Response response = await dioClient.getData(
          AppConstants.CATEGORY,
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  /* END ARTICAL */

  /* LIKE */

  Future <Response> getLiked (String? id) async {
    try{
      Response response = await dioClient.getData(
          "${AppConstants.GET_LIKE + "$id"}"
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
  Future <Response> createLike (String id) async{
    Map <String, dynamic> body = {
      "artical_id": id
    };
    try{
      Response response = await dioClient.postData(
          AppConstants.LIKE,body
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
  Future <Response> unlick(String id)async{
    try{
      Response response = await dioClient.deleteData(
          "${AppConstants.UNLIKE + "$id"}"
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  /* END LIKE */


}