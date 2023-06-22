
import 'dart:io';

import 'package:film_admin/data/api/api_client.dart';
import 'package:film_admin/data/model/register_model.dart';
import 'package:film_admin/data/model/userModel.dart';
import 'package:film_admin/provider/auth_controller.dart';
import 'package:film_admin/util/dimensions.dart';
import 'package:film_admin/util/material.dart';
import 'package:film_admin/util/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../util/spacing.dart';
import '../util/text_style.dart';
import 'Auth/login.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({Key? key}) : super(key: key);

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool? offsecureText = true;



var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.white, width: 0.5));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,

        body: Container(
            decoration: BoxDecoration(
               color: Colors.pink
            ),
            child: Form(
                key: formKey,
                child: Padding(
                  padding: FxSpacing.fromLTRB(
                      20, FxSpacing.safeAreaTop(context) + 20, 20,0),
                  child: ListView(
                      children: <Widget>[
                        Container(

                          padding: const EdgeInsets.only(bottom: 40.0),

                          alignment: Alignment.topLeft,
                          child:  IconButton(
                            icon: Icon(Icons.keyboard_backspace,
                              size: 22, color: Colors.white,),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),




                        Container(
                          alignment: Alignment.center,
                          child: FxText.displayLarge(
                            "បង្កើតគណនីនៅទីនេះ",
                            style: TextStyle(
                                fontFamily: "Cabin",
                                fontSize: 30,
                                color: Colors.white
                            ),
                            fontWeight: 700,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: FxText.bodyLarge(
                            "Sign Up your account here!",
                            fontWeight: 600,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.cyanAccent,
                            ),

                          ),
                        ),

                        SizedBox(
                          height: 40,
                        ),


                        TextFormField(
                          controller: nameController,
                          style: FxTextStyle.bodyMedium(),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              isDense: true,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Name",
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                              contentPadding: FxSpacing.all(16),
                              hintStyle: FxTextStyle.bodySmall(xMuted: true),
                              isCollapsed: true),
                          maxLines: 1,



                          validator: (String? value){
                            if (value!.length == 0) return "Name can't be empty";
                            return null;
                          },

                        ),

                        SizedBox(height: 20,),


                        TextFormField(
                          style: FxTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              isDense: true,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Email Address",
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                              contentPadding: FxSpacing.all(16),
                              hintStyle: FxTextStyle.bodySmall(xMuted: true),
                              isCollapsed: true),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? value){
                            if (value!.length == 0) return "Email can't be empty";
                            return null;
                          },
                          // onChanged: (String value){
                          //   setState(() {
                          //     email = value;
                          //   });
                          // },
                        ),
                        SizedBox(height: 20,),

                        TextFormField(
                          controller: passwordController,
                          style: FxTextStyle.bodyMedium(),
                          obscureText: offsecureText == true ? true : false,
                          decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              isDense: true,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Password",
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                              contentPadding: FxSpacing.all(16),
                              hintStyle: FxTextStyle.bodySmall(xMuted: true),
                              isCollapsed: true),


                          validator: (String? value){
                            if (value!.length == 0) return "Password can't be empty";
                            return null;
                          },
                          // onChanged: (String value){
                          //   setState(() {
                          //     pass = value;
                          //   });
                          // },
                        ),


                        SizedBox(height: 10,),
                        registerBtn(),
                        SizedBox(height: 10,),
                        // Container(
                        //   height: 45,
                        //   width: double.infinity,
                        //   child: ElevatedButton(
                        //       style: ButtonStyle(
                        //           backgroundColor: MaterialStateProperty.resolveWith((states) => Theme.of(context).primaryColor)
                        //       ),
                        //       child: signUpStarted == false
                        //           ? Text('sign up', style: TextStyle(fontSize: 16, color: Colors.white),)
                        //           : signUpCompleted == false
                        //           ? CircularProgressIndicator(backgroundColor: Colors.white)
                        //           : Text('sign up successful!', style: TextStyle(fontSize: 16, color: Colors.white)),
                        //       onPressed: (){
                        //         handleSignUpwithEmailPassword();
                        //       }),
                        // ),



                        SizedBox(height: 20,),
                        // Row(
                        //   children: [
                        //     Expanded(child: Divider(color: Colors.cyanAccent)),
                        //     Padding(
                        //       padding: FxSpacing.x(16),
                        //       child: FxText.bodySmall(
                        //         'Or Continue with',
                        //         muted: true,
                        //         fontSize: 10,
                        //         fontWeight: 600,
                        //         color: Colors.amberAccent,
                        //       ),
                        //     ),
                        //     Expanded(child: Divider(color: Colors.cyanAccent,)),
                        //   ],
                        // ),
                        // FxSpacing.height(25),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     RoundedLoadingButton(
                        //
                        //       child: FxContainer.bordered(
                        //         padding: FxSpacing.all(16),
                        //         borderRadiusAll: 4,
                        //         child:  Image(
                        //           height: 20,
                        //           width: 20,
                        //           image: AssetImage('assets/images/google.png'),
                        //         ),
                        //       ),
                        //       controller: _googleController,
                        //       onPressed: ()=> handleGoogleSignIn(),
                        //       width: 40,
                        //
                        //       color: Colors.blueAccent,
                        //       elevation: 0,
                        //       //borderRadius: 3,
                        //
                        //     ),
                        //
                        //     if(Platform.isIOS)
                        //       RoundedLoadingButton(
                        //         child: FxContainer.bordered(
                        //           padding: FxSpacing.all(16),
                        //           borderRadiusAll: 4,
                        //           child:  Image(
                        //             height: 20,
                        //             width: 20,
                        //             image: AssetImage('assets/images/apple.png'),
                        //           ),
                        //         ),
                        //         controller: _appleController,
                        //         onPressed: ()=> handleAppleSignIn(),
                        //         width: 40,
                        //
                        //         color: Colors.blueAccent,
                        //         elevation: 0,
                        //         //borderRadius: 3,
                        //
                        //       ),
                        //
                        //     // RoundedLoadingButton(
                        //     //   curve: Curves.easeInOut,
                        //     //   child: FxContainer.bordered(
                        //     //     padding: FxSpacing.all(16),
                        //     //     borderRadiusAll: 4,
                        //     //     child:  Image(
                        //     //       height: 20,
                        //     //       width: 20,
                        //     //       image: AssetImage('assets/images/facebook.png'),
                        //     //     ),
                        //     //   ),
                        //     //   controller: _facebookController,
                        //     //   onPressed: ()=> handleFacebbokLogin(),
                        //     //   width: 40,
                        //     //
                        //     //   color: Colors.blueAccent,
                        //     //   elevation: 0,
                        //     //   //borderRadius: 3,
                        //     //
                        //     // ),
                        //   ],
                        // ),

                      ]),
                )

            )));
  }





  Widget registerBtn() {
    return Column(
      children: [
        // FxText.bodySmall(
        //   "Already have an account?",
        //   color: Colors.white,
        // ),
        SizedBox(height: Dimensions.MARGIN_SIZE_EXTRA_LARGE,),
        material_App.CustomButton(
            title:'Login',
            width: Get.width * 0.9,
            height: Get.height * 0.07,
            onPressed: (){

              Get.find<AuthController>().register(
                email: emailController.text,
                  password: passwordController.text,
                name: nameController.text,
              ).then((value) {
                if (value == "OK") {
                  nextScreen(context, LoginScreen());
                }
                else {
                  Get.snackbar('Error', value!);
                }
              });
            }

        ),
      ],
    );
  }}