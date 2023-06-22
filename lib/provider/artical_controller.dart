import 'package:film_admin/data/model/artical_model.dart';
import 'package:film_admin/data/model/artical_model.dart';
import 'package:film_admin/data/model/categoryModel.dart';
import 'package:film_admin/data/model/like_model.dart';
import 'package:film_admin/data/repository/articalRepository.dart';
import 'package:film_admin/provider/auth_controller.dart';
import 'package:film_admin/util/next_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/model/articalBySub.dart';
import '../data/model/subCategory_model.dart';
import '../data/model/subCategory_model.dart';
import '../data/model/subCategory_model.dart';
import '../screen/Artical/artical_by_sub.dart';


class ArticalController extends GetxController implements GetxService {
  final ArticalRepository articalRepo;
  ArticalController({required this.articalRepo});
  @override
  void onInit() {
    super.onInit();
  }
  articalModel? _articalModel;
  sub_categoryModel? _sub_categoryModel;
  ArticalBySubModel? _articalBySubModel;
  List<Articalbysub> _articalBySubList = [];
  List<Articals> _articalsList = [];
  articalModel? _request_articalModel;
  CategoryModel? _categoryModel;
  Articals? _articals;

  bool? _isLike = false;
  LikeModel? _likeModel;
  List<Likes> _likesList = [];
  int? _id;




  List<Articals> get articalsList => _articalsList;
  articalModel? get ArticalModel => _articalModel;
  sub_categoryModel? get sub_categoryModels => _sub_categoryModel;
  ArticalBySubModel? get articalBySubModel => _articalBySubModel;
  List<Articalbysub> get articalBySubList => _articalBySubList;
  CategoryModel? get categoryModel => _categoryModel;
  articalModel? get request_articalModel => _request_articalModel;
  Articals? get articals => _articals;
  bool? get isLike => _isLike;
  LikeModel? get likeModel => _likeModel;
  List<Likes> get likesList => _likesList;
  int? get id => _id;


  Future  getSubCategory() async{
    try{
      var response = await articalRepo.getSubcategory();
      if (response.statusCode == 200) {
        _sub_categoryModel = sub_categoryModel.fromJson(response.body);
        print ('sub_categoryModel ${_sub_categoryModel!.subCategory![0].title}');
        return 'OK';
      }
    }
    catch(e){
      throw e.toString();
    }
  }
  Future  getArticalBySub(String id) async{
    try{
      var response = await articalRepo.getArticalBySub(id);
      if (response.body['message'] == 'OK') {
        var body = response.body;
       _articalBySubModel = ArticalBySubModel.fromJson(body);
        _articalBySubList = [];
        body = body['artical'];
        body.forEach((element) {
          _articalBySubList.add(Articalbysub.fromJson(element));
          _articalBySubModel = ArticalBySubModel(artical: _articalBySubList);
        });
        update();


        return 'OK';
      }
    }
    catch(e){
      throw e.toString();
    }
  }

  Future<void> getArticals() async {
    try {
      var response = await articalRepo.getArticals();
      if (response.statusCode == 200) {
        _articalsList = [];
        var body = response.body;
        body = body['articals'];

         body.forEach((element) {
            _articalsList.add(Articals.fromJson(element));
            _articalModel = articalModel(articals: _articalsList);
          });
         update();
         print ('sssse ${_articalModel!.articals![0].title}');
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> getArtcalbyCategory(String id) async{
try{
      var response = await articalRepo.getArticals();
      if (response.statusCode == 200) {
        _articalsList = [];
        var body = response.body;
        body = body['articals']['category_id'];
        body.forEach((element) {
          _articalsList.add(Articals.fromJson(element));
          _articalModel = articalModel(articals: _articalsList);

        });
        print ('categoryddd ${_articalModel!.articals![0].title}');
      }
    }
    catch(e){
      throw e.toString();
    }

  }
  // Future<void> getArtcalbyType(String id) async{
  //   try{
  //     var response = await articalRepo.getArticals();
  //     if (response.statusCode == 200) {
  //       _articalsList = [];
  //       var body = response.body;
  //       body = body['articals']['type_id'];
  //       body.forEach((element) {
  //         _articalsList.add(Articals.fromJson(element));
  //         _articalModel = articalModel(articals: _articalsList);
  //         _type_artical = Type_artical.fromJson(element);
  //
  //       });
  //       print ('type_articalllllll ${_articalModel!.articals![0].title}');
  //     }
  //   }
  //   catch(e){
  //     throw e.toString();
  //   }
  //
  // }

  Future getLike(String? id) async {
    try {
      var response = await articalRepo.getLiked(id);
      if (response.statusCode == 200) {

        return "OK";
      }
      else if (response.statusCode == 400) {
        var body = response.body['like'];
        _id = body;
        print('like_id ${_id}');
        _isLike = true;
        return "NO";

      }
    } catch (e) {
      throw e.toString();
    }

  }
  Future createLike(String id) async{
    try{
      var response = await articalRepo.createLike(id);
      if (response.statusCode == 201) {

        var body = response.body;

        // _isLike = true;
        _articalModel = articalModel.fromJson(body);
        return "OK";

        update();
      }
      else if( response.statusCode == 401){
        var body = response.body;
        _articalModel = articalModel.fromJson(body);
        return "UNAUTHORIZED";
      }
      else if( response.statusCode == 400){
        var body = response.body;
        _articalModel = articalModel.fromJson(body);
        unlick('${_id}');
        return "NO";
      }

    }
    catch(e){
      throw e.toString();
    }
  }
  Future unlick(String id)async{
    try{
      var response = await articalRepo.unlick(id);
      if (response.statusCode == 200) {
        var body = response.body;
        _articalModel = articalModel.fromJson(body);
        _isLike = true;
        return "OK";

      }
      else if( response.statusCode == 401){
        var body = response.body;
        _articalModel = articalModel.fromJson(body);
        return "UNAUTHORIZED";
      }
      else if( response.statusCode == 400){
        var body = response.body;
        _articalModel = articalModel.fromJson(body);
        return "NO";
      }

    }
    catch(e){
      throw e.toString();
    }
  }

   getArticalById(String id) async {
    try {
      var response = await articalRepo.getArticalById(id);
      if (response.statusCode == 200) {

        var body = response.body;
        body = body['artical'];
        //add body to model
        _request_articalModel = articalModel.fromJson(body);
        update();
      }
    } catch (e) {
      throw e.toString();
    }
  }
  Future<void> getTypevideo() async{
   try{
     var response = await articalRepo.getArticals();
     if (response.statusCode == 200 && response.body['articals']) {
       var body = response.body;
       body = body['artical'];
       //add body to model
       _request_articalModel = articalModel.fromJson(body);
       update();
   }
  }
  catch(e){
     throw e.toString();
   }
  }

  Future<void> getCategory() async {
    try {
      var response = await articalRepo.getCategory();
      if (response.statusCode == 200) {
        var body = response.body;
        // body = body['category'];
        //add body to model

        _categoryModel = CategoryModel.fromJson(body);
        update();
      }
    } catch (e) {
      throw e.toString();
    }

  }


}