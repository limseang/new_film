import 'package:film_admin/data/model/artical_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:get/get.dart';

import '../screen/Artical/artical_detail.dart';


void nextScreen (context, page){
  Navigator.push(context, MaterialPageRoute(
      builder: (context) => page));
}


void nextScreeniOS (context, page){
  Navigator.push(context, CupertinoPageRoute(
      builder: (context) => page));
}


void nextScreenCloseOthers (context, page){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => page), (route) => false);
}

void nextScreenReplace (context, page){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}


void nextScreenPopup (context, page){
  Navigator.push(context, MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => page),
  );
}

void navigateToDetailsScreen (context, Articals article, String? heroTag){
  if(article.typeId == 'video'){
    print('video');
    // Navigator.push(context, MaterialPageRoute(
    //     builder: (context) => articald(data: article)),
    //     // builder: (context) => VideoArticleDetails(data: article)),
    // );

  }else{
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ArticalDetail(articalDetail: article,)),
    );
  }
}


void navigateToDetailsScreenByReplace (context, Articals article, String? heroTag, bool? replace){
  if(replace == null || replace == false){
    navigateToDetailsScreen(context, article, heroTag);
  }else{
    if(article.typeId == 'video'){
      print('video');
      // Navigator.pushReplacement(context, MaterialPageRoute(
      //     builder: (context) => VideoArticleDetails(data: article)),
      // );

    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => ArticalDetail(articalDetail: Articals())),
      );
    }
  }
}


// void navigateToNotificationDetailsScreen (context, NotificationModel notificationModel){
//   if(notificationModel.postId == null){
//     nextScreen(context, CustomNotificationDeatils(notificationModel: notificationModel));
//   }else{
//     nextScreen(context, PostNotificationDetails(postID: notificationModel.postId!));
//   }
