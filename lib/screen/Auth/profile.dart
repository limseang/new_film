import 'dart:io';

import 'package:film_admin/data/model/userModel.dart';
import 'package:film_admin/provider/actor_controller.dart';
import 'package:film_admin/provider/artical_controller.dart';
import 'package:film_admin/provider/auth_controller.dart';
import 'package:film_admin/screen/Auth/edit_profile.dart';
import 'package:film_admin/screen/user/all_user.dart';
import 'package:film_admin/screen/welcome.dart';
import 'package:film_admin/util/dimensions.dart';
import 'package:film_admin/util/material.dart';
import 'package:film_admin/util/next_screen.dart';
import 'package:film_admin/util/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/api/api_client.dart';

class profileScreen extends StatefulWidget {


  profileScreen({Key? key,}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> with AutomaticKeepAliveClientMixin {


  late Future<UserModel> usermodel;
  AuthController authController = Get.find<AuthController>();
  @override

  bool? notlogin;
  bool? isloading = false;
  bool? isAdmin = false;




  init() async{
    // authController = Get.find<AuthController>();
    await Get.find<AuthController>().GetUserInfo().then((value) => {});
    authController.UsersModel!.user!.role_id == 'admin' || authController.UsersModel!.user!.role_id == 'editor' ? isAdmin = true : isAdmin = false;

    setState(() {
      isloading = true;
      isAdmin = isAdmin;
    });
  }







  void initState() {
    init();
    super.initState();

  }
  Widget build(BuildContext context) {
    return Scaffold(
       body: isloading == false
           ? Container(
         alignment: Alignment.center,
         child: CircularProgressIndicator(),
       )
           : SingleChildScrollView(
         child: Column(
           children: [
             Container(
               width: Get.width,
               height: Get.height * 0.5,
               child: Stack(
                 children: [
                   Container(
                     width: Get.width,
                     height: Get.height * 0.405,
                     decoration: BoxDecoration(
                       color: Colors.red,
                       borderRadius: BorderRadius.only(
                         bottomLeft: Radius.circular(20),
                         bottomRight: Radius.circular(20),
                       ),
                     ),
                     child: Column(
                       children: [
                         SizedBox(
                           height: Get.height * 0.21,
                         ),


                         Container(
                             alignment: Alignment.center,
                             width: Get.width,
                             height: 20,
                             child: Padding(
                               padding: const EdgeInsets.only(left: 50.0,right: 50.0),
                               child: Row(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [

                                   Text('Profile',style: textStyleBold.copyWith(color: Colors.white),),

                                   InkWell(
                                     onTap: (){
                                       // Get.find<AuthController>().logout().then((value) => {
                                       //   if(value == '200'){
                                       //     nextScreenCloseOthers(context, welcomeScreen())
                                       //   }
                                       // });
                                     },
                                     child: Text('',style: textStyleBold.copyWith(color: Colors.white),),
                                   ),
                                 ],
                               ),
                             )
                         )


                       ],
                     ),

                   ),

                   Container(
                     alignment: Alignment.bottomCenter,
                     width: Get.width,
                     height: Get.height * 0.5,
                     child: Container(
                       width: Get.width * 0.9,
                       height: Get.height * 0.25,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(20),
                         border: Border.all(
                           color: Colors.grey.shade200,
                           width: 1,
                         ),
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(0.2),
                             spreadRadius: 2,
                             blurRadius: 5,
                             offset: Offset(0, 3), // changes position of shadow
                           ),
                         ],
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           SizedBox(
                               height: Dimensions.PADDING_SIZE_OVER_LARGE
                           ),
                           Container(
                             alignment: Alignment.center,
                             child: Text('${authController.UsersModel?.user!.name ?? ''}',style: textStyleBold.copyWith(color: Colors.black87),),
                           ),
                           SizedBox(
                               height: Dimensions.PADDING_SIZE_SMALL
                           ),
                           Container(
                             alignment: Alignment.center,
                             child: Text('${authController.UsersModel?.user!.email ?? ''}',style: textStyleBold.copyWith(color: Colors.grey.shade600),),
                           ),
                           SizedBox(
                               height: Dimensions.MARGIN_SIZE_AUTH_SMALL
                           ),
                           Expanded(
                             child: Container(
                               // color: Colors.grey.shade200,
                               child: Column(
                                 children: [
                                   Container(
                                     width: Get.width * 0.9,
                                     height: 2,
                                     color: Colors.grey.shade200,
                                   ),

                                   Expanded(
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       children: [

                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Text('Point',style: textStyleBold.copyWith(color: Colors.grey.shade600),),
                                             SizedBox(
                                                 height: Dimensions.PADDING_SIZE_SMALL
                                             ),
                                             Text('${authController.UsersModel?.user!.point ?? ''}',style: textStyleBold.copyWith(color: Colors.pinkAccent),),
                                           ],
                                         ),
                                         Container(
                                           width: 2,
                                           color: Colors.grey.shade200,
                                         ),
                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Text('Role',style: textStyleBold.copyWith(color: Colors.grey.shade600),),
                                             SizedBox(
                                                 height: Dimensions.PADDING_SIZE_SMALL
                                             ),
                                             Text('${authController.UsersModel?.user!.role_id ?? ''}',style: textStyleBold.copyWith(color: Colors.pinkAccent),),
                                           ],
                                         ),

                                         Container(
                                           width: 2,
                                           color: Colors.grey.shade200,
                                         ),

                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Text('Phone',style: textStyleBold.copyWith(color: Colors.grey.shade600),),
                                             SizedBox(
                                                 height: Dimensions.PADDING_SIZE_SMALL
                                             ),
                                             Text('${authController.UsersModel?.user!.role_id ?? ''}',style: textStyleBold.copyWith(color: Colors.pinkAccent),),
                                           ],
                                         ),

                                       ],
                                     ),
                                   )
                                 ],
                               ),
                             ),
                           )
                         ],
                       ),
                     ),
                   ),

                   Padding(
                     padding: const EdgeInsets.only(bottom: 8.0),
                     child: Container(
                       alignment: Alignment.center,
                       width: Get.width,
                       height: Get.height * 0.5,
                       child: material_App.CustomAvatar(
                         point: authController.UsersModel?.user!.point ?? '',
                         image: authController.UsersModel?.user!.avatar ,
                         onPressed: (){
                           // GetImage();
                         },
                       ),

                     ),
                   )
                 ],
               ),
             ),
             SingleChildScrollView(
               physics: BouncingScrollPhysics(),
               child: Column(
                 children: [
                   SizedBox(height: Dimensions.PADDING_SIZE_LARGE,),
                   setting_tile('Edit Profile', FontAwesomeIcons.person,(){
                     nextScreen(context, editProfileScreen(userModel: authController.UsersModel?.user!,));
                   }),

                   SizedBox(height: Dimensions.PADDING_SIZE_LARGE,),
                   isAdmin != true ?
                   setting_tile('Request Movie', FontAwesomeIcons.film,(){
                     Get.find<ArticalController>().getCategory();
                   }) : setting_tile('All User', FontAwesomeIcons.peopleGroup,()async{
                    // nextScreen(context, page)
                    await Get.find<AuthController>().allUser().then((value) => {
                      if(value == 'OK'){
                        nextScreen(context, allUseScreen(user: authController.allUserModel,))
                      }
                    });
                   }) ,
                   SizedBox(height: Dimensions.PADDING_SIZE_LARGE,),
                   setting_tile('Logout', FontAwesomeIcons.doorOpen,(){
                     Get.find<AuthController>().logout('logout');
                   }),
                   SizedBox(height: Dimensions.PADDING_SIZE_LARGE,),
                   setting_tile('Delete account', FontAwesomeIcons.trash,(){
                     //create alert dialog
                     CustomAlertDialog.alertDiaLog(
                         context,
                         title: 'Delete Account',
                         content: 'Are you sure you want to delete your account?',
                         onTap: (){
                           Get.find<AuthController>().deleteAccount().then((value) => {
                             if(value == 'OK'){
                               Get.snackbar('Success', 'Account deleted successfully',backgroundColor: Colors.green,colorText: Colors.white),
                               Get.offAll(()=>welcomeScreen())
                             }
                             else{
                               Get.snackbar('Error', 'Something went wrong',backgroundColor: Colors.red,colorText: Colors.white),
                             }
                           });
                         }
                     );


                     // Get.find<AuthController>().deleteAccount().then((value) => {
                     //   if(value == 'OK'){
                     //     Get.snackbar('Success', 'Account deleted successfully',backgroundColor: Colors.green,colorText: Colors.white),
                     //     Get.offAll(()=>welcomeScreen())
                     //   }
                     //   else{
                     //     Get.snackbar('Error', 'Something went wrong',backgroundColor: Colors.red,colorText: Colors.white),
                     //   }
                     // });
                   }),
                   SizedBox(height: Dimensions.PADDING_SIZE_LARGE,),
                  isAdmin != true? setting_tile('About', FontAwesomeIcons.infoCircle,(){
                     print('About');
                   }) : setting_tile('Actor', FontAwesomeIcons.peopleLine,(){
                    Get.find<ActorController>().getActor(context);
                  }),
                   SizedBox(height: Dimensions.PADDING_SIZE_LARGE,),
                   setting_tile('Privacy Policy', FontAwesomeIcons.userSecret,(){
                     print('Privacy Policy');
                   }),
                   SizedBox(height: Dimensions.PADDING_SIZE_LARGE,),
                   setting_tile('Terms & Conditions', FontAwesomeIcons.fileContract,(){
                     print('Terms & Conditions');

                   }),
                 ],
               ),
             )


           ],
         ),
       )
    );
  }

  Container setting_tile(String? title, IconData? iconData, Function onTap) {
    return Container(
           child: InkWell(
             onTap: onTap as void Function()? ?? (){},
             child: Container(
               width: Get.width * 0.9,
               height: Get.height * 0.08,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(20),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.25),
                     spreadRadius: 0,
                     blurRadius: 2,
                     offset: Offset(0, 0), // changes position of shadow
                   ),
                 ],
               ),
               child: Padding(
                 padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                 child: Row(
                   children: [
                     Icon(
                       iconData,
                       color: Colors.grey.shade600,

                     ),
                     SizedBox(
                       width: Dimensions.PADDING_SIZE_LARGE,
                     ),
                     Text('$title',style: textStyleBold.copyWith(color: Colors.grey.shade600),),
                     Spacer(),
                     Icon(
                       Icons.arrow_forward_ios,
                       color: Colors.grey.shade600,
                       size: 20,
                     ),

                   ],
                 ),
               ),
             ),
           ),
          );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}


  // This shows a CupertinoModalPopup which hosts a CupertinoAlertDialog.
