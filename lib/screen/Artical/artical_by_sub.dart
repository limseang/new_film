
import 'package:film_admin/provider/artical_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class articalByScreen extends StatefulWidget {
  String id;
  articalByScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<articalByScreen> createState() => _articalByScreenState();
}

class _articalByScreenState extends State<articalByScreen> {

  init() async {
    Get.find<ArticalController>().getArticalBySub(widget.id);


  }

  @override
  void initState() {
    init();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artical By Sub'),
      ),
      body: ListView.builder(
          itemCount: Get.find<ArticalController>().articalBySubModel!.artical!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(Get.find<ArticalController>().articalBySubModel!.artical![index].title!),
              subtitle: Text(Get.find<ArticalController>().articalBySubModel!.artical![index].author!),
            );
          }
      )
    );
  }
}
