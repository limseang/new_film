import 'dart:io';

import 'package:film_admin/data/model/userModel.dart';
import 'package:film_admin/util/dimensions.dart';
import 'package:film_admin/util/material.dart';
import 'package:film_admin/util/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/api/api_client.dart';
import '../../provider/auth_controller.dart';
import '../../util/color_resources.dart';

class editProfileScreen extends StatefulWidget {
  User? userModel;
  editProfileScreen({Key? key, required this.userModel}) : super(key: key);

  @override
  State<editProfileScreen> createState() => _editProfileScreenState();
}

class _editProfileScreenState extends State<editProfileScreen> {
  @override
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool? _isshow = true;

  XFile? _pickImage;
  CroppedFile? _croppedFile;
  Future<void> _cropImage() async {
    if (_pickImage != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _pickImage!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Crop',
            cancelButtonTitle: 'cancel'.tr,
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
            const CroppieViewPort(width: 720, height: 1080, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }
  @override
  void initState() {
    _nameController.text = widget.userModel!.name!;
    _emailController.text = widget.userModel!.email!;

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('editProfileScreen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Dimensions.PADDING_SIZE_OVER_LARGE,
            ),

            Container(
              alignment: Alignment.topCenter,
              width: Get.width,

              child: _pickImage == null
                  ? material_App.CustomAvatar(
                isEditProfile: true,
                point: widget.userModel!.point,
                image: widget.userModel!.avatar,
                onPressed: (){
                  selectLanguage(context);
                },
              )
                  : Image.file(
                File(_pickImage!.path),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),

            ),
            SizedBox(
              height: Dimensions.HOME_PAGE_PADDING * 2,
            ),

            Text('${_nameController.text.isEmpty ? widget.userModel!.name : _nameController.text}',style: textStyleBold.copyWith(fontSize: 20),),
            SizedBox(height: Dimensions.HOME_PAGE_PADDING ,),
            Text('${widget.userModel!.email}',style: textStyleBold.copyWith(fontSize: 16,color: Colors.grey),),
            SizedBox(height: Dimensions.HOME_PAGE_PADDING * 3,),
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: Dimensions.HOME_PAGE_PADDING),
              child: Custom_Text_form(controller: _nameController, hint: widget.userModel!.name,
                // hint: 'Name' ,

              )
            ),
            SizedBox(height: Dimensions.HOME_PAGE_PADDING * 2,),
            Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: Dimensions.HOME_PAGE_PADDING),
                child: Custom_Text_form(controller: _emailController, hint: widget.userModel!.email,
                  // hint: 'Name' ,

                )
            ),
            SizedBox(height: Dimensions.HOME_PAGE_PADDING * 2,),
            Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: Dimensions.HOME_PAGE_PADDING),
                child: Custom_Password()
            ),
            SizedBox(height: Dimensions.HOME_PAGE_PADDING * 3,),
            Container(
              width: Get.width * 0.9,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.grey.withOpacity(0.2)
              ),
              child: material_App.CustomButton(
                // color: Colors.grey.withOpacity(0.2),
                title: 'Save',
                onPressed: (){
                  Get.find<AuthController>().updateProfile(_pickImage);
                },
              )
            )
            // material_App.CustomButton(
            //   title: 'Save',
            //   onPressed: (){
            //
            //   },
            // )

          ],
        ),
      ),
    );
  }

  Row Custom_Text_form({String? hint, TextEditingController? controller, }) {
    return Row(
            children: [
              Expanded(child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  //show name in hint
                  hintText: hint == null ? '': hint,

                  suffixIcon: IconButton(
                    onPressed: () {
                      controller!.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),

                  hintStyle: textStyleRegular.copyWith(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ))
            ],
          );
  }
  Row Custom_Password({TextEditingController? passwordController, bool? isshow}) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            obscuringCharacter: "*",
            obscureText: _isshow!,
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: 'Password',
              // border: InputBorder.none,

              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isshow = !_isshow!;
                  });
                },
                icon: Icon(
                  _isshow! ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
              hintStyle: textStyleRegular.copyWith(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),

      ],
    );
  }
  void selectLanguage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.0),
          ),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              height: 239,
              child: Column(
                children: [
                  Container(
                    height: 234,
                    child: Wrap(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 70,
                              height: 3,
                              // color: Colors.grey,
                              decoration: BoxDecoration(
                                  color: Color(0xffE7EBF1),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            _popItem(
                              "take_a_photo".tr,
                              onTap: () {
                                _chooseCamera();
                                Navigator.pop(context);
                              },
                            ),
                            _popItem(
                              "choose_from_album".tr,
                              onTap: () {
                                _choose();
                                Navigator.pop(context);
                              },
                            ),
                            _popItem("save_photo".tr),
                            _popItem(
                              "cancel".tr,
                              color: ColorResources.success_color,
                              isBottom: true,
                              onTap: () => Navigator.pop(context),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }


  _popItem(String text,
      {void Function()? onTap, bool isBottom = false, Color? color}) {
    return Column(
      children: [
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: Get.width * 0.9,
              alignment: Alignment.center,
              child: Text('$text'.tr,
                  style: textStyleLowMedium.copyWith(color: color),
                  textScaleFactor: 1.15)),
          onTap: onTap,
        ),
        isBottom ? SizedBox() : const Divider(),
      ],
    );
  }

  List<Model> list = [
    Model(
        text: "select_profile_picture".tr,
        icon: CupertinoIcons.photo_camera_solid,
        action: 1),
    Model(text: "camera".tr, icon: Icons.lock, action: 2),
  ];

  void _choose() async {
    final pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);

    setState(() async {
      if (pickedFile != null) {
        _pickImage = XFile(pickedFile.path);
        final croppedFile = await ImageCropper().cropImage(
          sourcePath: _pickImage!.path,
          compressFormat: ImageCompressFormat.jpg,
          compressQuality: 100,
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: 'Crop',
                toolbarColor: Colors.deepOrange,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            IOSUiSettings(
              title: 'Crop',
              cancelButtonTitle: 'cancel'.tr,
            ),
            WebUiSettings(
              context: context,
              presentStyle: CropperPresentStyle.dialog,
              boundary: const CroppieBoundary(
                width: 520,
                height: 520,
              ),
              viewPort: const CroppieViewPort(
                  width: 720, height: 1080, type: 'circle'),
              enableExif: true,
              enableZoom: true,
              showZoomer: true,
            ),
          ],
        );
        if (croppedFile != null) {
          _pickImage = XFile(croppedFile.path);

          setState(() {
            _croppedFile = croppedFile;
          });
        }
      } else {
        print('No image selected'.tr);
      }
    });
  }

  void _chooseCamera() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    setState(() async {
      if (pickedFile != null) {
        _pickImage = XFile(pickedFile.path);
        _cropImage();
        Get.find<AuthController>().updateProfile(_pickImage);
      } else {
        print('No image selected.'.tr);
      }
    });
  }
}

class Model {
  String? text;
  IconData? icon;
  int? action;

  Model({this.text, this.icon, this.action});
}



