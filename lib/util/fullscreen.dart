// import 'dart:io';
// import 'dart:typed_data';
//
// // import 'package:accordapp/view/base/custom_snack_bar.dart.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// import 'dimensions.dart';
// import 'package:dio/dio.dart';
// import 'dart:ui' as ui;
// import 'package:get/get.dart';
//
//
// class fullimage extends StatefulWidget {
//   String image;
//   String thumbnail;
//   bool changeprofile = false;
//   String? id;
//   bool? isFromEditContact;
//   fullimage(
//       {required this.image,
//       required this.thumbnail,
//       required this.changeprofile,
//       this.id,
//       this.isFromEditContact});
//   @override
//   State<fullimage> createState() => _fullimageState();
// }
//
// // _save(String image) async {
// //   if (image.contains('file://')) {
// //     final result = await ImageGallerySaver.saveFile(image);
// //     print(result);
// //   } else {
// //     var response = await Dio()
// //         .get(image, options: Options(responseType: ResponseType.bytes));
// //     final result =
// //         await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
// //     print(result);
// //   }
// // }
//
// GlobalKey _globalKey = GlobalKey();
// // _saveScreen() async {
// //   RenderRepaintBoundary boundary =
// //       _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
// //   ui.Image image = await boundary.toImage();
// //   ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
// //   if (byteData != null) {
// //     final result = await ImageGallerySaver.saveImage(
// //         byteData.buffer.asUint8List(),
// //         quality: 100);
// //     print(result);
// //   }
// // }
//
// class _fullimageState extends State<fullimage> {
//
//   // final contactController = Get.find<ContactController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       extendBody: true,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         brightness: Brightness.dark,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.clear),
//         ),
//         actions: [
//           Row(
//             children: [
//               widget.changeprofile == true
//                   ? IconButton(
//                       onPressed: () {
//                         print("change profile");
//                       },
//                       icon: Icon(Icons.home),
//                     )
//                   : InkWell(
//                       onTap: () async {
//                         if (Platform.isAndroid) {
//                           await Permission.storage.request();
//                         }
//                         if (widget.image.contains("http")) {
//                           _save(widget.image);
//                         } else {
//                           _saveScreen();
//                         }
//                         showCustomSnackBar("image_saved", context,
//                             isError: false);
//                       },
//                       child: Icon(
//                         CupertinoIcons.arrow_down_to_line,
//                         color: Colors.white,
//                       ),
//                     ),
//               SizedBox(
//                 width: 10,
//               ),
//               widget.isFromEditContact == true
//                   ? InkWell(
//                       onTap: () async {
//                         final action = CupertinoActionSheet(
//                           title: Text(
//                             "Delete Image",
//                             style: TextStyle(fontSize: 15.0),
//                           ),
//                           message: Text(
//                             "Are you sure you want to delete this image?",
//                             style: TextStyle(fontSize: 15.0),
//                           ),
//                           actions: <Widget>[
//                             CupertinoActionSheetAction(
//                               child: Text(
//                                 "Delete",
//                                 style: TextStyle(color: Colors.red),
//                               ),
//                               isDestructiveAction: true,
//                               onPressed: () async {
//                                 // await contactController.deleteImage(
//                                 //     widget.id!, widget.image);
//                                 // Navigator.pop(context);
//                                 // Navigator.pop(context);
//                               },
//                             )
//                           ],
//                           cancelButton: CupertinoActionSheetAction(
//                             child: Text("Cancel"),
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         );
//
//                       },
//                       child: Icon(
//                         CupertinoIcons.trash,
//                         color: Colors.white,
//                       ),
//                     )
//                   : Container(),
//             ],
//           )
//         ],
//       ),
//       body: Center(
//         child: PinchZoom(
//           child: Hero(
//             tag: '${widget.image}',
//             child: widget.image.contains('http')
//                 ? CachedNetworkImage(
//                     fit: BoxFit.fitWidth,
//                     imageUrl: widget.image,
//                     placeholder: (context, url) => Image.network(
//                       widget.thumbnail,
//                       fit: BoxFit.fitWidth,
//                     ),
//                   )
//                 : Image.file(File(widget.image)),
//           ),
//         ),
//       ),
//     );
//   }
// }
