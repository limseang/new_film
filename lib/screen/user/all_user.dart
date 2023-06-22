import 'package:film_admin/data/model/userModel.dart';
import 'package:film_admin/util/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/allUserModel.dart';

class allUseScreen extends StatefulWidget {
  AllUserModel? user;
  allUseScreen({super.key, required this.user});

  @override
  State<allUseScreen> createState() => _allUseScreenState();
}

class _allUseScreenState extends State<allUseScreen> {
  @override
  bool? pointshow = false;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All User is ${widget.user!.user!.length}"),
        ),
        body: Column(
          children: [
            //short by point
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Short by point"),
                IconButton(
                    onPressed: () {
                      setState(() {
                            //short from big point to
                        widget.user!.user!.sort((a, b) => b.point!.compareTo(a.point!));
                      });
                    },
                    icon: Icon(Icons.arrow_drop_down))
              ],
            ),

            Container(
              width: Get.width,
              height: Get.height * 0.8,
              child: ListView.builder(
                itemCount: widget.user!.user!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      width: Get.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              child: material_App.CustomAvatar(
                                image: widget.user!.user![index].avatar,
                                onPressed: () {},
                                point: widget.user!.user![index].point,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.user!.user![index].name}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                Text(
                                  '${widget.user!.user![index].email}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                Text(
                                  '${widget.user!.user![index].roleId}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
