
import 'package:film_admin/data/model/actorModel.dart';
import 'package:film_admin/provider/actor_controller.dart';
import 'package:film_admin/screen/Actor/actor_detail.dart';
import 'package:film_admin/util/material.dart';
import 'package:film_admin/util/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class allActorScreen extends StatefulWidget {
  ActorModel? actorModelList;
  allActorScreen({super.key, this.actorModelList});

  @override
  State<allActorScreen> createState() => _allActorScreenState();
}

class _allActorScreenState extends State<allActorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Actor (${widget.actorModelList!.data!.length})'),
      ),
      body: ListView.builder(
        itemCount: widget.actorModelList!.data!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
             nextScreen(context, actorDetailScreen(actorModel: widget.actorModelList!.data![index],));
            },
            child: Card(
              child: ListTile(
                title: Text(widget.actorModelList!.data![index].firstName!.toUpperCase()),
                subtitle: Text(widget.actorModelList!.data![index].lastName!),
                leading: Container(
                  width: 60,
                  height: 100,
                  child: material_App.CustomAvatar(
                      image: widget.actorModelList!.data![index].profile!,
                      point: 0,
                      onPressed: (){}
                  ),
                )
              ),
            ),
          );
        },
      ),
    );
  }
}
