

import 'dart:async';

import 'package:film_admin/data/model/appModel.dart';
import 'package:film_admin/provider/auth_controller.dart';
import 'package:film_admin/screen/Auth/login.dart';
import 'package:film_admin/screen/Auth/profile.dart';
import 'package:film_admin/screen/Home.dart';
import 'package:film_admin/screen/signup.dart';
import 'package:film_admin/screen/welcome.dart';
import 'package:film_admin/util/app_constants.dart';
import 'package:film_admin/util/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';


import '../data/model/register_model.dart';
import '../helper/token_helper.dart';

class splasScreen extends StatefulWidget {
  const splasScreen({Key? key}) : super(key: key);

  @override
  State<splasScreen> createState() => _splasScreenState();
}
TokenHelper tokenHelper = TokenHelper();
afterSplash() async {
    try {
      await Get.find<AuthController>().checkVersion().then((value) => {
        if (value == true) {
          gotoSignInPage()
        } else {
          nextScreenReplace(Get.context!, homeScreen())
        }

      });
    } catch (e) {
      gotoSignInPage();
    }
  }


gotoSignInPage ()async{
  await Get.find<AuthController>().GetUserInfo().then((value) {
    print('value: $value');
    if (value == 'OK') {
      nextScreenReplace(Get.context!, homeScreen());
    } else {
      nextScreenReplace(Get.context!, welcomeScreen());
    }
  });



}

class _splasScreenState extends State<splasScreen>  with SingleTickerProviderStateMixin {
  AnimationController? scaleController;
  Animation<double>? scaleAnimation;

  bool _a = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;
  bool secondAnim = false;

  Color boxColor = Colors.transparent;
  @override
  void initState() {
    Timer(Duration(milliseconds: 600), () {
      setState(() {
        boxColor = Get.iconColor!;
        _a = true;
      });
    });
    Timer(Duration(milliseconds: 1500), () {
      setState(() {
        boxColor = context.scaffoldBackgroundColor;
        _c = true;
      });
    });
    Timer(Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(Duration(milliseconds: 3200), () {
      secondAnim = true;

      scaleController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000),
      )..forward();
      scaleAnimation = Tween<double>(begin: 0.0, end: 12).animate(scaleController!);

      setState(() {
        _d = true;
      });
    });

    Timer(Duration(milliseconds: 4200), () {
      secondAnim = true;
      setState(() {});
     afterSplash();
    });
    afterBuildCreated(() async {
      setValue(AppConstants.appOpenCount, (getIntAsync(AppConstants.appOpenCount)) + 1);
      await afterSplash();
    });
    afterSplash();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                  ? Get.height / 4.5
                  : 20,
              width: 20,
            ),
            AnimatedContainer(
              duration: Duration(seconds: _c ? 2 : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? Get.height
                  : _c
                  ? 130
                  : 20,
              width: _d
                  ? Get.width
                  : _c
                  ? 130
                  : 20,
              decoration: BoxDecoration(
                  color: boxColor,
                  //shape: _c? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: _d ? BorderRadius.only() : BorderRadius.circular(30)),
              child: secondAnim
                  ? Center(
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(color: ThemeMode.dark == ThemeMode.dark ? Colors.white : Colors.black, shape: BoxShape.circle),
                  child: AnimatedBuilder(
                    animation: scaleAnimation!,
                    builder: (c, child) => Transform.scale(
                      scale: scaleAnimation!.value,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ThemeMode.dark == ThemeMode.dark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              )
                  : Center(
                child: _e ? Image.asset('${AppConstants.APP_ICON}', height: 170, width: 170, fit: BoxFit.cover) : SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
