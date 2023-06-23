import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_admin/provider/film_controller.dart';
import 'package:film_admin/util/cards/featured_card.dart';
import 'package:film_admin/util/dimensions.dart';
import 'package:film_admin/util/next_screen.dart';
import 'package:film_admin/util/style.dart';
import 'package:film_admin/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:film_admin/data/model/artical_model.dart';
import '../provider/artical_controller.dart';
import 'package:http/http.dart' as http;
import 'Artical/artical_by_sub.dart';
import 'Artical/artical_detail.dart';

class Artical extends StatefulWidget {
  const Artical({Key? key}) : super(key: key);

  @override
  State<Artical> createState() => _ArticalState();
}

class _ArticalState extends State<Artical> with AutomaticKeepAliveClientMixin {
  late Future<articalModel> articalmodel;
  ArticalController articalController = Get.find<ArticalController>();
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  init() async {
    await articalController.getArticals();
    await articalController.getCategory();
    await articalController.getSubCategory();
    setState(() {
      isLoading = true;
    });
  }

  static const colorizeTextStyle = TextStyle(
    fontSize: 20.0,
    fontFamily: 'Cabin',
  );
  static const colorizeColors = [
    Color(0xffEA7EAE),
    Colors.blue,
    Color(0xffE753B2),
    Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticalController>(
      builder: (controller) {
        return Scaffold(
          body: NestedScrollView(
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
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
              body: isLoading == false
                  ? Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        //category
                        Container(
                          alignment: Alignment.center,
                          width: Get.width,
                          height: 40,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: articalController
                                .categoryModel?.categories!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 2.0),
                                    child: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.pinkAccent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Center(
                                          child: Text(
                                            articalController
                                                    .categoryModel
                                                    ?.categories![index]
                                                    .title ??
                                                "",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 30,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: articalController
                                .sub_categoryModels?.subCategory!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    nextScreen(
                                        context,
                                        articalByScreen(
                                          id: '${articalController.sub_categoryModels?.subCategory![index].id}',
                                        ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 2.0),
                                    child: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Center(
                                          child: Text(
                                            articalController
                                                    .sub_categoryModels
                                                    ?.subCategory![index]
                                                    .title ??
                                                "",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                          ),
                        ),

                        SizedBox(
                          height: Dimensions.MARGIN_SIZE_LARGE,
                        ),
                        Container(
                            width: Get.width,
                            height: 240,
                            //show all artical has type id == 1
                            child: ListView.builder(
                              itemCount: articalController.articalsList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    nextScreen(
                                        context,
                                        ArticalDetail(
                                          articalDetail: articalController
                                              .articalsList[index],
                                        ));
                                  },
                                  child: articalController
                                              .articalsList[index].featureId ==
                                          'normal'
                                      ? Container(
                                          // height: 280,
                                          width: Get.width,
                                          child: FeaturedCard(
                                            d: articalController
                                                .articalsList[index],
                                            heroTag: 'avc$index',
                                          ),
                                        )
                                      : Container(
                                          // height: 280,
                                          width: Get.width,
                                          child: FeaturedCard(
                                            heroTag: 'avc$index',
                                          ),
                                        ),
                                );
                              },
                            )),

                        SizedBox(
                          height: Dimensions.chooseReviewImageSize,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                Get.find<FilmController>().getFilm();
                              },
                              child: Text(
                                "More Artical",
                                style: textStyleMedium.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),

                        //show all artical and title
                        Expanded(
                          child: ListView.builder(
                            itemCount: articalController.articalsList.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    // Get.find<ArticalController>().getArtcalbyType(articalController.articalsList[index].typeId ?? "");
                                    nextScreen(
                                        context,
                                        ArticalDetail(
                                          articalDetail: articalController
                                              .articalsList[index],
                                        ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20, bottom: 10),
                                    child: Container(
                                        height: 100,
                                        width: Get.width * 0.9,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:
                                              ThemeMode.dark == ThemeMode.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Container(
                                                height: 65,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        articalController
                                                                .articalsList[
                                                                    index]
                                                                .thumnail ??
                                                            ""),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    articalController
                                                            .articalsList[index]
                                                            .title ??
                                                        "",
                                                    style: textStyleMedium
                                                        .copyWith(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.black54),
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color:
                                                              Colors.pinkAccent,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0),
                                                          child: Text(
                                                            articalController
                                                                    .articalsList[
                                                                        index]
                                                                    .categoryId ??
                                                                "",
                                                            style: textStyleRegular
                                                                .copyWith(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .black54),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color:
                                                              Colors.pinkAccent,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0),
                                                          child: Text(
                                                            '${articalController.articalsList[index].sub_cateogry_id}',
                                                            style: textStyleRegular
                                                                .copyWith(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .black54),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color:
                                                              Colors.pinkAccent,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0),
                                                          child: Text(
                                                            '${articalController.articalsList[index].author}',
                                                            style: textStyleRegular
                                                                .copyWith(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .black54),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                  ));
                            },
                          ),
                        ),
                      ],
                    )),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Text(""),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.cover)),
                ),
                ListTile(
                  title: Text("Artical"),
                  onTap: () {
                    nextScreen(context, Artical());
                  },
                ),
                ListTile(
                  title: Text("Category"),
                  onTap: () {
                    nextScreen(context, Artical());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ListView feather_card(ArticalController controller) {
  //    return ListView.builder(
  //                  itemCount: controller.articalsList.length,
  //                  scrollDirection: Axis.horizontal,
  //                  itemBuilder: (context, index) {
  //                    return GestureDetector(
  //                      onTap: () {
  //                        nextScreen(context, ArticalDetail(
  //                          articalDetail: controller.articalsList[index],
  //
  //                        ));
  //                      },
  //                      child: FeaturedCard(
  //                        d: controller.articalsList[index],
  //                        heroTag: 'featured$index',
  //
  //                      )
  //                    );
  //
  //
  //                  },
  //
  //                );
  //  }

  @override
  bool get wantKeepAlive => true;
}
