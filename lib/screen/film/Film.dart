import 'package:film_admin/data/model/filmModel.dart';
import 'package:film_admin/util/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../provider/film_controller.dart';
import '../../util/cards/featured_card.dart';

class filmScreen extends StatefulWidget {
  const filmScreen({super.key});

  @override
  State<filmScreen> createState() => _filmScreenState();
}

class _filmScreenState extends State<filmScreen> {
  // FilmModel filmModel = Get.find<FilmController>().filmModel!;
  // List<FilmModelList> filmModelList = Get.find<FilmController>().filmModelList!;

  init() async {
    await Get.find<FilmController>().getFilm();
    setState(() {
      FilmModel filmModel = Get.find<FilmController>().filmModel!;
      List<FilmModelList> filmModelList =
          Get.find<FilmController>().filmModelList!;
    });
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
      body: GetBuilder<FilmController>(
        builder: (controller) {
          if (controller.filmModelList!.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    new SliverAppBar(
                      backgroundColor: Colors.pinkAccent,
                      automaticallyImplyLeading: false,
                      centerTitle: false,
                      titleSpacing: 0,
                      title: Container(
                        //create search icon when click show search bar
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //drower
                              GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Film Library",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      pinned: true,
                      floating: true,
                      forceElevated: innerBoxIsScrolled,
                    ),
                  ];
                },
                body: Padding(
                  padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Now showing',
                        style: textStyleBlack,
                      ),
                     //show only featureId == 'now showing'
                      Container(
                        height: 250,
                        width: 140,
                        child: ListView.builder(
                          itemCount: controller.filmModelList!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: controller
                                          .filmModelList![index].featureId ==
                                      'now showing'
                                  ? Stack(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 200,
                                            width: 140,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(controller
                                                    .filmModelList![index]
                                                    .poster!),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.red,
                                            ),
                                            child: Center(
                                                child: Text(
                                                    "${controller.filmModelList?[index].rateId ?? '0'}")),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text('nothing'),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Coming soon',
                        style: textStyleBlack,
                      ),

                      Container(
                        height: 250,
                        width: 140,
                        child: ListView.builder(
                          itemCount: controller.filmModelList!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: controller
                                          .filmModelList![index].featureId ==
                                      'coming soon'
                                  ? Stack(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 200,
                                            width: 140,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(controller
                                                    .filmModelList![index]
                                                    .poster!),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.red,
                                            ),
                                            child: Center(
                                                child: Text(
                                                    "${controller.filmModelList?[index].rateId ?? '0'}")),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text('nothing'),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ));
          }
        },
      ),
    );
  }
}
