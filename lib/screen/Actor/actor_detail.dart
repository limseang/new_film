import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_admin/data/model/actorModel.dart';
import 'package:film_admin/util/custom_image.dart';
import 'package:film_admin/util/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../provider/actor_controller.dart';
import '../../util/dimensions.dart';
import '../../util/style.dart';
import '../../util/text_style.dart';

class actorDetailScreen extends StatefulWidget {
  ActorModelList actorModel;
  actorDetailScreen({super.key, required this.actorModel});

  @override
  State<actorDetailScreen> createState() => _actorDetailScreenState();
}

class _actorDetailScreenState extends State<actorDetailScreen> {
  @override
  void initState() {
    initRefresh();
    super.initState();
  }

  final actorModelList = Get.find<ActorController>().actorModelList;
  bool isRefresh = false;

  initRefresh()  async{
    await Get.find<ActorController>().getActorById(context, '${widget.actorModel.id!}');
    setState(() {
      isRefresh = true;
    });
  }

  int caculateAge(String dob) {
    var date = DateTime.parse(dob);
    var now = DateTime.now();
    var age = now.year - date.year;
    print('age $age');
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isRefresh == false ? Center(
        child: CircularProgressIndicator(),
      ) : Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.72,
            child: Stack(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * 0.26,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(

                        '${widget.actorModel.cover}',

                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                      alignment: Alignment.center,
                      width: Get.width,
                      height: Get.height * 0.5,
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Colors.white,
                                width: 5,
                              ),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  '${widget.actorModel.profile!}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 220.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.actorModel.firstName} ${widget.actorModel.lastName }',
                                  style: textStyleBlack.copyWith(fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'As known as :  ${widget.actorModel.alsoKnowAs }',
                                  style: textStyleRegular.copyWith(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),

                Positioned(
                   top: 300,
                    child: Container(
                      width: Get.width,
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10,right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ជីវប្រវត្តិសង្ខែប',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Cabin',
                                )),
                            SizedBox(height: 10,),

                            Container(
                              width: Get.width,
                              height: 200,

                              child: Text(
                                '${widget.actorModel.bio}',
                                style: textStyleRegular.copyWith(
                                    fontSize: 15, color: Colors.grey),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          ' ថ្ងៃកំណើត: ',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Cabin',
                                          ),
                                        ),
                                        Text(
                                          '${widget.actorModel.dob }',
                                          style: textStyleRegular.copyWith(
                                              fontSize: 15, color: Colors.grey),
                                        ),
                                        //calculate age
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '( ${caculateAge('${widget.actorModel.dob}')} ឆ្នាំ )',
                                          style: textStyleRegular.copyWith(
                                              fontSize: 15, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          'ជនជាតិ: ',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Cabin',
                                          ),
                                        ),
                                        Text(
                                          '${widget.actorModel.categoryArtistId}',
                                          style: textStyleRegular.copyWith(
                                              fontSize: 15, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  top: 40,
                  left: 10,
                  child: InkWell(
                    onTap: () {
                      Get.back();

                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 40,
                      height: 40,

                      child: Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black.withOpacity(0.5),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.only(left: 7.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ធ្លាប់សម្តែងក្នុងរឿងចំនួន (0)',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Cabin',
                  ),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: Get.width,
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          'https://upload.wikimedia.org/wikipedia/commons/6/6e/Shah_Rukh_Khan_graces_the_launch_of_the_new_Santro.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
