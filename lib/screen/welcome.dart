import 'dart:io';

import 'package:film_admin/screen/signup.dart';
import 'package:film_admin/util/app_constants.dart';
import 'package:film_admin/util/dimensions.dart';
import 'package:film_admin/util/material.dart';
import 'package:film_admin/util/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Auth/login.dart';
class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              SizedBox(height: Dimensions.LOGO_HEIGHT,),
              Image(
                image: AssetImage(AppConstants.APP_ICON),
                height: 300,
                width: 300,
                fit: BoxFit.contain,
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
              Text('Welcome to Film Admin',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: Dimensions.MARGIN_SIZE_AUTH,),
              material_App.CustomButton(
                  title: 'Login',
                  width: Get.width * 0.9,
                  height: Get.height * 0.07,
                  onPressed: (){
                    nextScreen(context, LoginScreen());
                  }
              ),
              SizedBox(height: Dimensions.MARGIN_SIZE_LARGE,),
              material_App.CustomButton(
                  title: 'Register',
                  width: Get.width * 0.9,
                  height: Get.height * 0.07,
                  onPressed: (){
                    nextScreen(context, registerScreen());
                  }
              ),
              SizedBox(height: Dimensions.MARGIN_SIZE_AUTH_SMALL,),
              Text('or Login with',),
              SizedBox(height: Dimensions.MARGIN_SIZE_AUTH_SMALL,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 material_App.CustomIcon(
                   width: 50,
                   height: 50,
                    color: Colors.pink,
                    iconColor: Colors.white,
                    icon: Icons.facebook,
                    onPressed: (){
                      print('facebook');
                    }
                 ),
SizedBox(width: Dimensions.MARGIN_SIZE_DEFAULT,),
                  material_App.CustomIcon(
                      width: 50,
                      height: 50,
                      color: Colors.blue,
                      iconColor: Colors.white,
                      icon: Icons.mail,
                      onPressed: (){
                        print('google');
                      }
                  ),
                  SizedBox(width: Dimensions.MARGIN_SIZE_DEFAULT,),
                  if(Platform.isIOS) material_App.CustomIcon(
                      width: 50,
                      height: 50,
                      color: Colors.black,
                      iconColor: Colors.white,
                      icon: Icons.apple,
                      onPressed: (){
                        print('apple');
                      }
                  ),




                ],
              ),
              SizedBox(height: Dimensions.MARGIN_SIZE_AUTH_SMALL,),
              Text('version :${AppConstants.APP_VERSION}',style: TextStyle(fontSize: 12),),



            ]
          )),
    );
  }
}
//create custom button

