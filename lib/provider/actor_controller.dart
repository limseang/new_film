import 'package:film_admin/data/model/actorModel.dart';
import 'package:film_admin/screen/Actor/actor_detail.dart';
import 'package:film_admin/screen/Actor/all_actor.dart';
import 'package:film_admin/util/next_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/model/respone/actorInfoModel.dart';
import '../data/repository/actorRepositor.dart';

class ActorController extends GetxController implements GetxService {

  final ActorRepository actorRepo;
  ActorController({required this.actorRepo});
  @override
  void onInit() {
    super.onInit();
  }

  ActorModel? _actorModel;
  List<ActorModelList> ? _actorModelList = [];
  ActorInfoModel? _actorInfoModel;
  ActorInfoModelList? _actorInfoModelList;


  ActorModel? get actorModel => _actorModel;
  ActorInfoModel? get actorInfoModel => _actorInfoModel;
  ActorInfoModelList? get actorInfoModelList => _actorInfoModelList;
  List<ActorModelList> ? get actorModelList => _actorModelList;

  Future getActor(BuildContext context) async{
    try{
      var response = await actorRepo.getActor();
      if (response.statusCode == 200) {
        _actorModel = ActorModel.fromJson(response.body);
        _actorModelList = _actorModel!.data;

        print('actorModel ${_actorModel!.data![0].firstName}');
        nextScreen(context, allActorScreen(actorModelList: _actorModel,));
        update();
      }
      return response.statusCode;
    }catch(e){
      print(e);
    }
  }

  Future<void> getActorById(BuildContext context,String id) async{
    try{
      var response = await actorRepo.getActorById(id);
      if (response.statusCode == 200) {
        var body = response.body;
        body = body['data'];
        print('actorModelinfo ${body}');
      _actorInfoModel = ActorInfoModel.fromJson(body);

        update();

      }

    }catch(e){
      print(e);
    }
  }

  // Future<void> getArtcalbyCategory(String id) async{
  //   try{
  //     var response = await articalRepo.getArticals();
  //     if (response.statusCode == 200) {
  //       _articalsList = [];
  //       var body = response.body;
  //       body = body['articals']['category_id'];
  //       body.forEach((element) {
  //         _articalsList.add(Articals.fromJson(element));
  //         _articalModel = articalModel(articals: _articalsList);
  //
  //       });
  //       print ('categoryddd ${_articalModel!.articals![0].title}');
  //     }
  //   }




}