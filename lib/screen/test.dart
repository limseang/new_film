
import 'package:film_admin/provider/auth_controller.dart';
import 'package:film_admin/provider/film_controller.dart';
import 'package:film_admin/util/cards/featured_card.dart';
import 'package:film_admin/util/material.dart';
import 'package:film_admin/util/next_screen.dart';
import 'package:film_admin/util/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:film_admin/data/model/artical_model.dart';
import '../provider/artical_controller.dart';
import 'package:http/http.dart' as http;
import '../util/cards/card4.dart';
import 'Artical/artical_detail.dart';

class Artical extends StatefulWidget {
  const Artical({Key? key}) : super(key: key);

  @override
  State<Artical> createState() => _ArticalState();
}

class _ArticalState extends State<Artical> with AutomaticKeepAliveClientMixin {
  late Future<articalModel> articalmodel;
  ArticalController articalController = Get.find<ArticalController>();
  AuthController authController = Get.find<AuthController>();
  FilmController filmController = Get.find<FilmController>();
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
    await authController.GetUserInfo();
    await filmController.getFilm();
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
    var usermodel = authController.UsersModel!.user;
    var film = filmController.filmModelList;
    var artical = articalController.articalsList;

    return GetBuilder<ArticalController>(
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Hello',style: textStyleMedium,),
                                  SizedBox(width: 4,),
                                  Text('${usermodel!.name}',style: textStyleMedium.copyWith(
                                      fontSize: 20,
                                      color: Colors.pinkAccent
                                  ),
                                  ),
                                ],
                              ),

                              Text('Welcome to Film Library',style: textStyleMedium.copyWith(
                                  fontSize: 14,
                                  color: Color(0xffA0A0A0)
                              ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: 53,
                            height: 53,
                            child: material_App.CustomAvatar(onPressed: (){},
                                image: usermodel.avatar,
                                point: usermodel.point
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    //create search bar
                    Container(
                      height: 60,
                      width: Get.width,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Row(
                            children: [
                              ImageIcon(
                                AssetImage("assets/icons/search.png"),
                                color: Colors.black54,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Search",
                                style: textStyleRegular,
                              ),
                              Spacer(),
                              Container(
                                width: 1,
                                height: 20,
                                color: Color(
                                    0xffA0A0A0

                                ),),
                              SizedBox(
                                width: 4,
                              ),
                              ImageIcon(
                                AssetImage("assets/icons/mic.png"),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Filters',style: textStyleLowMedium.copyWith(
                          fontSize: 18
                      ),),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        material_App.CustomIconButtom(
                          title: 'Category',
                          onPressed: (){},
                          image: AssetImage('assets/icons/category.png'),),
                        material_App.CustomIconButtom(
                          title: 'Top Rated',
                          onPressed: (){},
                          image: AssetImage('assets/icons/star.png'),),
                        material_App.CustomIconButtom(
                          title: 'Popular',
                          onPressed: (){},
                          image: AssetImage('assets/icons/category.png'),),
                        material_App.CustomIconButtom(
                          title: 'Newest',
                          onPressed: (){},
                          image: AssetImage('assets/icons/category.png'),),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Hot News',style: textStyleLowMedium.copyWith(
                          fontSize: 18
                      ),),
                    ),
                    SizedBox(
                      height: 10,

                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      height: 150,
                      width: 500,

                      child:
                      isLoading == false
                          ? Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      )
                          : Container(
                          height: Get.height,
                          width: Get.width,
                          child: ListView.builder(
                            itemCount: artical.length,
                            scrollDirection: Axis.horizontal,
                           physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  nextScreen(
                                      context,
                                      ArticalDetail(
                                        articalDetail: artical[index],
                                      ));
                                },
                                child: artical[index].featureId ==
                                    'normal'
                                    ? Stack(
                                      children: [
                                        Container(
                                          width: 500,
                                          height: 150,
                                          decoration: BoxDecoration(

                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      artical[index].thumnail!),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Container(
                                          width: 500,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Colors.transparent,
                                                    Colors.black.withOpacity(0.7)
                                                  ])),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          left: 10,
                                          child: Container(
                                            width: Get.width,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  artical[index].title!,
                                                  style: textStyleMedium.copyWith(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      artical[index].categoryId!,
                                                      style: textStyleRegular
                                                          .copyWith(
                                                          fontSize: 12,
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Container(
                                                      width: 4,
                                                      height: 4,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      artical[index].author!,
                                                      style: textStyleRegular
                                                          .copyWith(
                                                          fontSize: 12,
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Container(
                                                      width: 4,
                                                      height: 4,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      artical[index].typeId !,
                                                      style: textStyleRegular
                                                          .copyWith(
                                                          fontSize: 12,
                                                          color: Colors.white),
                                                    ),

                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white),
                                            child: Center(
                                              child: Icon(
                                                Icons.bookmark_border,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                    : Container(
                                  width: Get.width,
                                  height: Get.height,
                                ),
                              );
                            },
                          )
                      ),

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Now Showing',style: textStyleLowMedium.copyWith(
                          fontSize: 18
                      ),),
                    ),
                    SizedBox(
                      height: 10,

                    ),
                   Container(
                     alignment: Alignment.centerLeft,
                     width: Get.width,
                     height: 150,
                     child: ListView.builder(
                        itemCount: film!.length,
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
                            child: film![index].featureId ==
                                'now showing'
                                ? Stack(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: 100,

                                      decoration: BoxDecoration(

                                        image: DecorationImage(
                                          image: NetworkImage(
                                              film[index].poster ?? ""),
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        width: Get.width,
                                        height: 40,
                                        decoration: BoxDecoration(

                                          color: Colors.black26,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0),
                                          child: Center(
                                            child: Text(
                                              film[index].title ?? "",
                                              style: textStyleRegular.copyWith(
                                                  fontSize: 10,
                                                  color: Colors.white
                                              ),
                                            ),
                                          ),
                                        ),

                                      )
                                    )
                                  ],
                                )
                                : Container(

                              width: Get.width,
                              height: Get.height,
                            ),
                          );
                        },
                      ),
                     ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Popular News',style: textStyleLowMedium.copyWith(
                          fontSize: 18
                      ),),
                    ),
                    SizedBox(
                      height: 10,

                    ),
                   Container(
                     width: Get.width,

                     child: ListView.builder(
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       itemCount: artical.length,
                       itemBuilder: (context, index) {
                         return InkWell(
                           onTap: () {
                             // Get.to(ArticalDetailScreen(articalDetail: articalController.articalList[index],));
                           },
                           child: Padding(
                             padding: const EdgeInsets.only(top: 8.0),
                             child: Card4(
                               d: artical[index],
                               heroTag: 'moreartical',
                             ),
                           ),
                         );
                       },
                     ),
                   )



                   //loop film


                    // isLoading == false
                    //     ? Container(
                    //   alignment: Alignment.center,
                    //   child: CircularProgressIndicator(),
                    // )
                    //     : Column(
                    //   children: [
                    //     SizedBox(
                    //       height: 20,
                    //     ),
                    //     //category
                    //     Container(
                    //       alignment: Alignment.center,
                    //       width: Get.width,
                    //       height: 40,
                    //       child: ListView.builder(
                    //         scrollDirection: Axis.horizontal,
                    //         itemCount: articalController
                    //             .categoryModel?.categories!.length,
                    //         itemBuilder: (context, index) {
                    //           return GestureDetector(
                    //               onTap: () {},
                    //               child: Padding(
                    //                 padding: const EdgeInsets.only(
                    //                     left: 8.0, right: 2.0),
                    //                 child: Container(
                    //                   height: 30,
                    //                   decoration: BoxDecoration(
                    //                     borderRadius: BorderRadius.circular(10),
                    //                     color: Colors.pinkAccent,
                    //                   ),
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.only(
                    //                         left: 8.0, right: 8.0),
                    //                     child: Center(
                    //                       child: Text(
                    //                         articalController
                    //                             .categoryModel
                    //                             ?.categories![index]
                    //                             .title ??
                    //                             "",
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 12,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ));
                    //         },
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       height: 20,
                    //     ),
                    //     Container(
                    //       height: 30,
                    //       child: ListView.builder(
                    //         scrollDirection: Axis.horizontal,
                    //         itemCount: articalController
                    //             .sub_categoryModels?.subCategory!.length,
                    //         itemBuilder: (context, index) {
                    //           return GestureDetector(
                    //               onTap: () {
                    //                 nextScreen(
                    //                     context,
                    //                     articalByScreen(
                    //                       id: '${articalController.sub_categoryModels?.subCategory![index].id}',
                    //                     ));
                    //               },
                    //               child: Padding(
                    //                 padding: const EdgeInsets.only(
                    //                     left: 8.0, right: 2.0),
                    //                 child: Container(
                    //                   height: 30,
                    //                   decoration: BoxDecoration(
                    //                     borderRadius: BorderRadius.circular(10),
                    //                     color: Colors.blue,
                    //                   ),
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.only(
                    //                         left: 8.0, right: 8.0),
                    //                     child: Center(
                    //                       child: Text(
                    //                         articalController
                    //                             .sub_categoryModels
                    //                             ?.subCategory![index]
                    //                             .title ??
                    //                             "",
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 12,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ));
                    //         },
                    //       ),
                    //     ),
                    //
                    //     SizedBox(
                    //       height: Dimensions.MARGIN_SIZE_LARGE,
                    //     ),
                    //     Container(
                    //         width: Get.width,
                    //         height: 240,
                    //         //show all artical has type id == 1
                    //         child: ListView.builder(
                    //           itemCount: articalController.articalsList.length,
                    //           scrollDirection: Axis.horizontal,
                    //           itemBuilder: (context, index) {
                    //             return GestureDetector(
                    //               onTap: () {
                    //                 nextScreen(
                    //                     context,
                    //                     ArticalDetail(
                    //                       articalDetail: articalController
                    //                           .articalsList[index],
                    //                     ));
                    //               },
                    //               child: articalController
                    //                   .articalsList[index].featureId ==
                    //                   'normal'
                    //                   ? Container(
                    //                 // height: 280,
                    //                 width: Get.width,
                    //                 child: FeaturedCard(
                    //                   d: articalController
                    //                       .articalsList[index],
                    //                   heroTag: 'avc$index',
                    //                 ),
                    //               )
                    //                   : Container(
                    //                 // height: 280,
                    //                 width: Get.width,
                    //                 child: FeaturedCard(
                    //                   heroTag: 'avc$index',
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //         )),
                    //
                    //     SizedBox(
                    //       height: Dimensions.chooseReviewImageSize,
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 20.0),
                    //       child: Container(
                    //         alignment: Alignment.centerLeft,
                    //         child: InkWell(
                    //           onTap: () {
                    //             Get.find<FilmController>().getFilm();
                    //           },
                    //           child: Text(
                    //             "More Artical",
                    //             style: textStyleMedium.copyWith(
                    //               fontSize: 20,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //
                    //     //show all artical and title
                    //     Expanded(
                    //       child: ListView.builder(
                    //         itemCount: articalController.articalsList.length,
                    //         scrollDirection: Axis.vertical,
                    //         itemBuilder: (context, index) {
                    //           return GestureDetector(
                    //               onTap: () {
                    //                 // Get.find<ArticalController>().getArtcalbyType(articalController.articalsList[index].typeId ?? "");
                    //                 nextScreen(
                    //                     context,
                    //                     ArticalDetail(
                    //                       articalDetail: articalController
                    //                           .articalsList[index],
                    //                     ));
                    //               },
                    //               child: Padding(
                    //                 padding: const EdgeInsets.only(
                    //                     left: 20.0, right: 20, bottom: 10),
                    //                 child: Container(
                    //                     height: 100,
                    //                     width: Get.width * 0.9,
                    //                     decoration: BoxDecoration(
                    //                       borderRadius:
                    //                       BorderRadius.circular(10),
                    //                       color:
                    //                       ThemeMode.dark == ThemeMode.dark
                    //                           ? Colors.white
                    //                           : Colors.black,
                    //                       boxShadow: [
                    //                         BoxShadow(
                    //                           color:
                    //                           Colors.grey.withOpacity(0.2),
                    //                           spreadRadius: 1,
                    //                           blurRadius: 1,
                    //                           offset: Offset(0,
                    //                               1), // changes position of shadow
                    //                         ),
                    //                       ],
                    //                     ),
                    //                     child: Row(
                    //                       mainAxisAlignment:
                    //                       MainAxisAlignment.start,
                    //                       children: [
                    //                         Padding(
                    //                           padding: const EdgeInsets.only(
                    //                               left: 8.0),
                    //                           child: Container(
                    //                             height: 65,
                    //                             width: 60,
                    //                             decoration: BoxDecoration(
                    //                               borderRadius:
                    //                               BorderRadius.circular(10),
                    //                               image: DecorationImage(
                    //                                 image: NetworkImage(
                    //                                     articalController
                    //                                         .articalsList[
                    //                                     index]
                    //                                         .thumnail ??
                    //                                         ""),
                    //                                 fit: BoxFit.cover,
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         SizedBox(
                    //                           width: 10,
                    //                         ),
                    //                         Padding(
                    //                           padding: const EdgeInsets.only(
                    //                               top: 20.0),
                    //                           child: Column(
                    //                             crossAxisAlignment:
                    //                             CrossAxisAlignment.start,
                    //                             children: [
                    //                               Text(
                    //                                 articalController
                    //                                     .articalsList[index]
                    //                                     .title ??
                    //                                     "",
                    //                                 style: textStyleMedium
                    //                                     .copyWith(
                    //                                     fontSize: 16,
                    //                                     color:
                    //                                     Colors.black54),
                    //                               ),
                    //                               SizedBox(
                    //                                 height: 12,
                    //                               ),
                    //                               Row(
                    //                                 children: [
                    //                                   Container(
                    //                                     alignment:
                    //                                     Alignment.center,
                    //                                     height: 30,
                    //                                     decoration:
                    //                                     BoxDecoration(
                    //                                       borderRadius:
                    //                                       BorderRadius
                    //                                           .circular(10),
                    //                                       color:
                    //                                       Colors.pinkAccent,
                    //                                     ),
                    //                                     child: Padding(
                    //                                       padding:
                    //                                       const EdgeInsets
                    //                                           .only(
                    //                                           left: 8.0,
                    //                                           right: 8.0),
                    //                                       child: Text(
                    //                                         articalController
                    //                                             .articalsList[
                    //                                         index]
                    //                                             .categoryId ??
                    //                                             "",
                    //                                         style: textStyleRegular
                    //                                             .copyWith(
                    //                                             fontSize:
                    //                                             12,
                    //                                             color: Colors
                    //                                                 .black54),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                   SizedBox(
                    //                                     width: 10,
                    //                                   ),
                    //                                   Container(
                    //                                     alignment:
                    //                                     Alignment.center,
                    //                                     height: 30,
                    //                                     decoration:
                    //                                     BoxDecoration(
                    //                                       borderRadius:
                    //                                       BorderRadius
                    //                                           .circular(10),
                    //                                       color:
                    //                                       Colors.pinkAccent,
                    //                                     ),
                    //                                     child: Padding(
                    //                                       padding:
                    //                                       const EdgeInsets
                    //                                           .only(
                    //                                           left: 8.0,
                    //                                           right: 8.0),
                    //                                       child: Text(
                    //                                         '${articalController.articalsList[index].sub_cateogry_id}',
                    //                                         style: textStyleRegular
                    //                                             .copyWith(
                    //                                             fontSize:
                    //                                             12,
                    //                                             color: Colors
                    //                                                 .black54),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                   SizedBox(
                    //                                     width: 10,
                    //                                   ),
                    //                                   Container(
                    //                                     alignment:
                    //                                     Alignment.center,
                    //                                     height: 30,
                    //                                     decoration:
                    //                                     BoxDecoration(
                    //                                       borderRadius:
                    //                                       BorderRadius
                    //                                           .circular(10),
                    //                                       color:
                    //                                       Colors.pinkAccent,
                    //                                     ),
                    //                                     child: Padding(
                    //                                       padding:
                    //                                       const EdgeInsets
                    //                                           .only(
                    //                                           left: 8.0,
                    //                                           right: 8.0),
                    //                                       child: Text(
                    //                                         '${articalController.articalsList[index].author}',
                    //                                         style: textStyleRegular
                    //                                             .copyWith(
                    //                                             fontSize:
                    //                                             12,
                    //                                             color: Colors
                    //                                                 .black54),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ],
                    //                               )
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     )),
                    //               ));
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
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
