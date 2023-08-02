

import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_admin/util/custom_image.dart';
import 'package:film_admin/util/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart';
import 'package:html_unescape/html_unescape.dart';
import 'color_resources.dart';

class material_App{

  static CustomButton({required String title, required Function onPressed, Color? color, width, height}){
    return Container(
      width: width!=null ? width.toDouble() : double.infinity,
      height: height!=null ? height.toDouble() : double.infinity,
      child: ElevatedButton(
        onPressed: (){
          onPressed();
        },
        child: Text(title),
      ),
    );
  }
  static CustomIcon({ required Function onPressed, Color? color, width, height, required IconData icon, Color? iconColor}){
    return Container(
      width: width!=null ? width.toDouble() : double.infinity,
      height: height!=null ? height.toDouble() : double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(icon,color: iconColor,)
      ),
    );
  }
  static CustomAvatar({ required Function onPressed, Color? color, width, height, required image,required point, bool? isEditProfile }){
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: isEditProfile == true ? Stack(
        children: [
          CustomCacheImage(imageUrl: image, radius: 100 , cinema: false,),
      Positioned(
        bottom: 0,
        right: 0,
        child: Center(
            child: FaIcon(FontAwesomeIcons.camera,size: 15,)),
      ),
        ],
      )
          :  Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                color: color,

                ),
                child: CustomCacheImage(imageUrl: image, radius: 50 , cinema: false,),
                ),
    );
  }

  static CustomIconButtom({required String title, required Function onPressed, Color? color, width, height, AssetImage? image, Color? iconColor}){
    return Column(
      children: [
        Container(
          width: width!=null ? width.toDouble() :52,
          height: height!=null ? height.toDouble() : 52,
          decoration: BoxDecoration(
            color: color != null ? color : Color(0xff51535E),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Container(
                width: 30,
                height: 30,
                child: Image(image: image!,),
              )
          ),
        ),
        SizedBox(height: 10,),
        Text(title,style: textStyleRegular.copyWith(fontSize: 12),)
      ],
    );
  }

}



class CustomAlertDialog {
  static void alertDiaLog(BuildContext context,
      {required String title, required String content, void Function()? onTap,bool? ischangephone}) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text('$title',style: textStyleBlack.copyWith(fontSize: 15),),
        content: Text('$content'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Cancel',
              style: textStyleMedium.copyWith(color: Color(0xff27AE60)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ischangephone == true
              ? CupertinoDialogAction(
            child: Text(
              'OK',
              style: textStyleMedium.copyWith(color: Colors.black),
            ),
            onPressed: onTap,
          )
              : CupertinoDialogAction(
              child: Text(
                'Delete',
                style:
                textStyleMedium.copyWith(color: ColorResources.error_color),
              ),
              onPressed: onTap
          ),
        ],
      ),
    );
  }
  void showAlertDialog(BuildContext context,{ String? title, String? content, String? cancelActionText, String? confirmActionText, Function? onConfirm}) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context,{ String? title, String? content, String? cancelActionText, String? confirmActionText, Function? onConfirm}) => CupertinoAlertDialog(
        title: Text('$title'),
        content: Text('${content}'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(

            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('${cancelActionText}'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              onConfirm!();
            },
            child: Text('${confirmActionText}'),
          ),
        ],
      ),
    );
  }
}
Future openLinkWithCustomTab(BuildContext context, String url) async {
  try{
    await FlutterWebBrowser.openWebPage(
      url: url,
      customTabsOptions: CustomTabsOptions(
        colorScheme: CustomTabsColorScheme.dark,
        //addDefaultShareMenuItem: true,
        instantAppsEnabled: true,
        showTitle: true,
        urlBarHidingEnabled: true,
      ),
      safariVCOptions: SafariViewControllerOptions(
        barCollapsingEnabled: true,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        modalPresentationCapturesStatusBarAppearance: true,
      ),
    );
  }catch(e){
    // show toast from get
    // openToast1(context, 'Cant launch the url');
    print("Cant launch the url");
    debugPrint(e.toString());
  }


}




