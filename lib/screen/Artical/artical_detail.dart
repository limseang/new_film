import 'package:film_admin/data/model/artical_model.dart';
import 'package:film_admin/provider/artical_controller.dart';
import 'package:film_admin/util/app_constants.dart';
import 'package:film_admin/util/custom_HTML.dart';
import 'package:film_admin/util/dimensions.dart';
import 'package:film_admin/util/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import '../../util/cards/card4.dart';

class ArticalDetail extends StatefulWidget {
  final Articals? articalDetail;
  ArticalDetail({Key? key, required this.articalDetail}) : super(key: key);

  @override
  State<ArticalDetail> createState() => _ArticalDetailState();
}

class _ArticalDetailState extends State<ArticalDetail> {
  @override
  void initState() {
    init();
    super.initState();
  }

  bool isLike = false;
  init() async {
    await Get.find<ArticalController>().getLike("${widget.articalDetail!.id!}");
    setState(() {
      isLike = true;
    });
  }
  Widget build(BuildContext context) {
    return GetBuilder<ArticalController>(
      builder: (artical) {
        return Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: isLike == false
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        new SliverAppBar(
                          backgroundColor: Colors.transparent,
                          automaticallyImplyLeading: false,
                          centerTitle: false,
                          titleSpacing: 0,
                          title: Container(
                            //create search icon when click show search bar
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 25.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //click to back
                                  IconButton(
                                    onPressed: () async{
                                      await Get.find<ArticalController>().getArticals();
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: AppConstants.appColor,
                                    ),
                                  ),

                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${widget.articalDetail!.categoryId}",
                                    style:
                                        TextStyle(color: AppConstants.appColor),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: AppConstants.appColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          pinned: false,
                          floating: true,
                          forceElevated: innerBoxIsScrolled,
                        ),
                      ];
                    },
                    body: SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_Thirty_Five,
                        ),
                        Container(
                          width: Get.width * 0.86,
                          height: 260,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.articalDetail!.thumnail!),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_LARGE,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.86,
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.spaceBetween,
                            mainAxisAlignment: MainAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LikeButton(
                                isLiked: artical.isLike ?? false,
                                size: 30,
                                circleColor: CircleColor(
                                    start: Colors.redAccent,
                                    end: Colors.redAccent),
                                bubblesColor: BubblesColor(
                                  dotPrimaryColor: Colors.redAccent,
                                  dotSecondaryColor: Colors.redAccent,
                                ),
                                onTap: (bool isLiked) async {
                                  await Get.find<ArticalController>()
                                      .createLike(
                                          "${widget.articalDetail!.id}");
                                  return !isLiked;
                                },
                                likeBuilder: (bool isLiked) {
                                  return Icon(
                                    Icons.favorite,
                                    color: isLiked
                                        ? Colors.redAccent
                                        : Colors.grey,
                                    size: 30,
                                  );
                                },
                                likeCount: widget.articalDetail!.like,
                                countBuilder:
                                    (int? count, bool isLiked, String text) {
                                  var color =
                                      isLiked ? Colors.redAccent : Colors.grey;

                                  Widget result;
                                  if (count == isLiked) {
                                    result = Text(
                                      text,
                                      style: TextStyle(color: color),
                                    );
                                  } else {
                                    result = Text(
                                      text,
                                      style: TextStyle(color: color),
                                    );
                                  }

                                  return result;
                                },
                              ),
                              SizedBox(
                                width: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                              ),
                              Text(
                                'អត្ថបទដោយ : ${widget.articalDetail!.author}',
                                style: textStyleMedium.copyWith(
                                    fontSize: 16, color: AppConstants.appColor),
                              ),
                              SizedBox(
                                width: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                              ),
                              Icon(
                                Icons.person,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_LARGE,
                        ),
                        //convert updateat to date
                        Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.86,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 16,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: Dimensions.PADDING_SIZE_SMALL,
                              ),
                              Text(
                                '${widget.articalDetail!.updatedAt!.substring(0, 10)}',
                                style: textStyleMedium.copyWith(
                                    fontSize: 12, color: Colors.grey),
                              ),
                              SizedBox(
                                width: Dimensions.PADDING_SIZE_Thirty_Five,
                              ),
                              FaIcon(
                                FontAwesomeIcons.newspaper,
                                size: 16,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: Dimensions.PADDING_SIZE_SMALL,
                              ),
                              Text(
                                '${widget.articalDetail!.tagId}',
                                style: textStyleMedium.copyWith(
                                    fontSize: 12, color: Colors.grey),
                              ),
                              SizedBox(
                                width: Dimensions.PADDING_SIZE_Thirty_Five,
                              ),
                              FaIcon(
                                FontAwesomeIcons.eye,
                                size: 16,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: Dimensions.PADDING_SIZE_SMALL,
                              ),
                              Text(
                                '${widget.articalDetail!.typeId}',
                                style: textStyleMedium.copyWith(
                                    fontSize: 12, color: Colors.grey),
                              ),

                              // Text('${widget.articalDetail!.updatedAt!.substring(0,10)}',style: textStyleMedium.copyWith(fontSize: 12,),),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.MARGIN_SIZE_AUTH_SMALL,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.86,
                          child: Text(
                            widget.articalDetail!.title!,
                            style: textStyleMedium.copyWith(
                                fontSize: 16, color: AppConstants.appColor),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_LARGE,
                        ),
                        Container(
                          width: Get.width * 0.86,
                          height: 2,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_LARGE,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.94,
                          child: HtmlBodyWidget(
                            content: '${widget.articalDetail!.content}',
                            isIframeVideoEnabled: true,
                            isVideoEnabled: true,
                            isimageEnabled: true,
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_LARGE,
                        ),
                        Container(
                          // width: Get.width * 0.86,
                          height: 100,
                          color: Colors.grey,
                          child: Center(
                            child: Text('Admob'),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_Thirty_Five,
                        ),
                        Container(
                          width: Get.width * 0.86,
                          child: Text(
                            'More Articals',
                            style: textStyleMedium.copyWith(
                                fontSize: 20, color: AppConstants.appColor),
                          ),
                        ),
                        // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
                        //show more artical from same category

                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          width: Get.width * 0.9,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: artical.articalsList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  // Get.to(ArticalDetailScreen(articalDetail: articalController.articalList[index],));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Card4(
                                    d: artical.articalsList[index],
                                    heroTag: 'moreartical',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ]),
                    ),
                  ));
      },
    );
  }
}
