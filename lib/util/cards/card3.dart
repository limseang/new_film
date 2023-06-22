import 'package:film_admin/data/model/artical_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pod_player/pod_player.dart';

import '../custom_image.dart';
import '../next_screen.dart';
import '../video_icon.dart';

class Card3 extends StatefulWidget {
  final Articals d;
  final String? heroTag;
  final bool? replace;
  final bool? isvideo;
  final String? videoUrl;

  const Card3({Key? key, required this.d, required this.heroTag, this.replace, this.isvideo, this.videoUrl})
      : super(key: key);

  @override
  State<Card3> createState() => _Card3State();
}

class _Card3State extends State<Card3> {
  PodPlayerController? _podPlayerController;
  @override
  void initState() {

    _podPlayerController = PodPlayerController(
      playVideoFrom: PlayVideoFrom.network(widget.videoUrl ?? ''),
      podPlayerConfig: PodPlayerConfig(
        autoPlay: false,
      )
    );
    _podPlayerController!.dispose();
    super.initState();

  }
  Widget build(BuildContext context) {

    bool isvideo = false;
    return InkWell(
      child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(5),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Theme.of(context).shadowColor,
                    blurRadius: 10,
                    offset: Offset(0, 3))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: widget.heroTag == null
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 140,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: CustomCacheImage(
                                imageUrl: widget.d.thumnail, radius: 5.0),
                          ),
                          VideoIcon(
                            contentType: widget.d.typeId,
                            iconSize: 60,
                          )
                        ],
                      )
                    : Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Hero(
                                tag: widget.heroTag!,
                                child: CustomCacheImage(
                                    imageUrl: widget.d.thumnail, radius: 5.0),
                              ),
                            ),
                            VideoIcon(
                              contentType: widget.d.typeId,
                              iconSize: 60,
                            )
                          ],
                        ),
              ),
              SizedBox(
                width: 15,
              ),
              Flexible(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.d.title!,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 3, bottom: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blueGrey[600]),
                      child: Text(
                        widget.d.categoryId!,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.time,
                          color: Theme.of(context).secondaryHeaderColor,
                          size: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        // Text(
                        //   widget.d.date!,
                        //   style: TextStyle(
                        //       color: Theme.of(context).secondaryHeaderColor,
                        //       fontSize: 13),
                        // ),
                        Spacer(),
                        Icon(
                          Icons.favorite,
                          color: Colors.grey,
                          size: 20,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(widget.d.like.toString(),
                            style: TextStyle(
                                color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 13)),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
      onTap: (){
        if(widget.isvideo == true){
         _podPlayerController!.pause();
        }
        navigateToDetailsScreenByReplace(context, widget.d, widget.heroTag, widget.replace);
      }
    );
  }
}
