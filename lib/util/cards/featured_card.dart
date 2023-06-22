import 'package:film_admin/data/model/artical_model.dart';
import 'package:film_admin/screen/Artical/artical_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/model/artical_model.dart';
import '../../data/model/artical_model.dart';
import '../../data/model/artical_model.dart';
import '../custom_image.dart';
import '../next_screen.dart';
import '../video_icon.dart';


class FeaturedCard extends StatelessWidget {
  // final String? name;
  // final String? content;
  // final String? thumbnail;
  // final String? category;
  // final String? type;
  // final int? like;
  final Articals? d;
  final heroTag;
  FeaturedCard({Key? key, this.d, this.heroTag});


  @override
  Widget build(BuildContext context) {
    return d == null ? InkWell(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Stack(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.black12,borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Theme.of(context).shadowColor,
                              blurRadius: 10,
                              offset: Offset(0, 3))
                        ]),

                    child: Hero(
                        tag: heroTag,
                        child: CustomCacheImage(imageUrl: 'https://alidropship.com/wp-content/uploads/2019/12/50-best-banner-ads-examples.jpg' , radius: 5)),
                  ),
                  VideoIcon(contentType: 'ផ្សព្វផ្សាយពាណិជ្ជកម្មជាមួយយើង', iconSize: 80,)
                ],
              ),

              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'ផ្សព្វផ្សាយពាណិជ្ជកម្មជាមួយយើង',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                      ],
                    ),
                  ))
            ],
          ),
        ),
        onTap: () {
          nextScreen(context, ArticalDetail(articalDetail: d ));
        }
    ) :InkWell(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Stack(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.black12,borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Theme.of(context).shadowColor,
                              blurRadius: 10,
                              offset: Offset(0, 3))
                        ]),

                    child: Hero(
                        tag: heroTag,
                        child: CustomCacheImage(imageUrl: d!.thumnail , radius: 5)),
                  ),
                  VideoIcon(contentType: '${d!.type}', iconSize: 80,)
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10,),
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.deepPurpleAccent.withOpacity(0.7)),
                        child: Text(
                          '${d!.categoryId!}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Spacer(),
                      Container(
                          padding:
                          EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.black45),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.favorite,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                d!.like.toString() ?? '0',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            d!.title!,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                      ],
                    ),
                  ))
            ],
          ),
        ),
        onTap: () {
          nextScreen(context, ArticalDetail(articalDetail: d ));
        }
    );
  }
}