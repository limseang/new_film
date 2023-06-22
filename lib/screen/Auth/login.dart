import 'package:film_admin/data/model/login_model.dart';
import 'package:film_admin/data/model/userModel.dart';
import 'package:film_admin/provider/auth_controller.dart';
import 'package:film_admin/screen/Auth/profile.dart';
import 'package:film_admin/screen/welcome.dart';
import 'package:film_admin/util/material.dart';
import 'package:film_admin/util/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/register_model.dart';
import '../../util/app_constants.dart';
import '../../util/dimensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);


  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? _isshow = false;
  @override




  Widget build(BuildContext context) {
    return Scaffold(

        body: InkWell(
          splashColor: Colors.transparent,
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [

                  //create register form
                  SizedBox(height: Dimensions.LOGO_HEIGHT,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: IconButton(
                        onPressed: (){
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
                      ),
                    ),
                  ),
                  Image(
                    image: AssetImage(AppConstants.APP_ICON),
                    height: 300,
                    width: 300,
                    fit: BoxFit.contain,
                  ),
                  // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
                  Text('v${AppConstants.APP_VERSION}',style: TextStyle(color: Colors.grey),),
                  SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE,),
                  Container(
                    width: Get.width * 0.9,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: Dimensions.MARGIN_SIZE_EXTRA_LARGE,),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isshow!,
                          decoration: InputDecoration(
                            hintText: 'password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: _isshow! ? Icon(Icons.visibility) : Icon(Icons.visibility_off),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (String? value){
                            if (value!.length == 0) return "Password can't be empty";
                            return null;
                          },
                          onTap: (){
                            setState(() {
                              _isshow = !_isshow!;
                            });
                          },
                          onChanged: (String value){
                            setState(() {
                              // passwordController.text = value;
                            });
                          },
                        ),
                        SizedBox(height: Dimensions.MARGIN_SIZE_AUTH_SMALL ,),
                        material_App.CustomButton(
                            title:'Login',
                          width: Get.width * 0.9,
                          height: Get.height * 0.07,
                          onPressed: (){

                                Get.find<AuthController>().login(
                                 email: emailController.text,
                                  password: passwordController.text,
                                );
                              }

                        )
                      ],
                    )
                  )


                ],
              ),
            ),
          ),
        ),
    ) ;
  }

  Row Custom_Password({TextEditingController? passwordController, bool? isshow}) {
    return Row(
                            children: [
                             Expanded(
                                child: TextFormField(
                                  obscuringCharacter: "*",
                                  obscureText: _isshow!,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.lock),
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimensions.MARGIN_SIZE_EXTRA_SMALL,),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _isshow = !_isshow!;
                                  });
                                },
                                child: Icon(
                                  _isshow! ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          );
  }
}
