import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_admin/data/model/filmModel.dart';
import 'package:film_admin/provider/film_controller.dart';
import 'package:film_admin/util/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../util/expandable.dart';

class Film_Detail_Screen extends StatefulWidget {
  FilmModelList ? filmModelList;
  Film_Detail_Screen({super.key , this.filmModelList});

  @override
  State<Film_Detail_Screen> createState() => _Film_Detail_ScreenState();
}

class _Film_Detail_ScreenState extends State<Film_Detail_Screen> {
  final _controller = ScrollController();
  final expandedHeight = 240.0;
  double _offset = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      body: ExpandableBottomSheet(
        background: CustomScrollView(
          controller: _controller,

          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: expandedHeight,
              collapsedHeight: 90,
              stretch: true,
              backgroundColor: Colors.black,
              foregroundColor: Colors.transparent,
              flexibleSpace: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: CachedNetworkImage(
                        imageUrl: '${widget.filmModelList!.poster}',
                        fit: BoxFit.cover,

                      ),
                      expandedTitleScale: 1,
                      titlePadding: const EdgeInsets.all(24),

                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          color: Colors.black.withOpacity(0.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  '${widget.filmModelList!.title}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 00,
                    child: Container(
                      width: 280,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),topLeft: Radius.circular(10)),
                      ),
                      child: Row(

                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'ទទួលបានពិន្ទុ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('${widget.filmModelList!.rateId ?? "0"} \/10',
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'ពីមនុស្សចំនួន',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('${widget.filmModelList!.peopleRate}',
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'នាក់',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),


                        ],
                      ),
                    ),
                  )
                ],
              )
            ),
            // Used to get the stretch effect to not be above the SliverAppBar


            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: Get.height ,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/background.png'),
                        fit: BoxFit.cover
                      ),

                    ),
                    child: SingleChildScrollView(
                      child: Column(

                        children: [
                          SizedBox(height: 20,),
                          Text('តារាសម្តែង',style: TextStyle(
                            fontFamily: "Cabin",
                            fontSize: 20,
                            color: Colors.white,
                          ),),
                          SizedBox(height: 20,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.filmModelList!.actor!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    width: 100,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage('${widget.filmModelList!.actor![index].image}'),
                                        fit: BoxFit.cover
                                      )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0,top: 8.0),
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Text('${widget.filmModelList!.actor![index].name}',style: TextStyle(
                                          fontFamily: "Cabin",
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: Get.width,
                            height: Get.height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.5)
                            ),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 20,),
                                Text('សាច់រឿង',style: TextStyle(
                                  fontFamily: "Cabin",
                                  fontSize: 20,
                                  color: Colors.white,
                                ),),
                                SizedBox(height: 20,),
                                Text('${widget.filmModelList!.overview}',style: TextStyle(
                                  fontFamily: "Cabin",
                                  fontSize: 14,
                                  color: Colors.white,
                                ),textAlign: TextAlign.center,),
                                SizedBox(height: 20,),
                                Text('បន្ថែមទៀត',style: TextStyle(
                                  fontFamily: "Cabin",
                                  fontSize: 20,
                                  color: Colors.white,
                                ),),
                                SizedBox(height: 20,),
                                Text('ថ្ងៃចាក់បញ្ចាំង : ${widget.filmModelList!.releaseDate}',style: TextStyle(
                                  fontFamily: "Cabin",
                                  fontSize: 14,
                                  color: Colors.white,
                                ),),
                                Text('ជាខ្សែភាពយន្តប្រភេទ  : ${widget.filmModelList!.genre}',style: TextStyle(
                                  fontFamily: "Cabin",
                                  fontSize: 14,
                                  color: Colors.white,
                                ),),
                                Text('មានថេរវេលា: ${widget.filmModelList!.runningTime}',style: TextStyle(
                                  fontFamily: "Cabin",
                                  fontSize: 14,
                                  color: Colors.white,
                                ),),
                                Text('ជារឿងរបស់ប្រទេស : ${widget.filmModelList!.country}',style: TextStyle(
                                  fontFamily: "Cabin",
                                  fontSize: 14,
                                  color: Colors.white,
                                ),),
                                SizedBox(height: 20,),
                               GestureDetector(
                                 onTap: (){
                                   print("trailer");
                                 },
                                  child: Container(
                                    width: Get.width * 0.8,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red
                                    ),
                                    child: Center(
                                      child: Text('ទស្សនា Trailer',style: TextStyle(
                                        fontFamily: "Cabin",
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),),
                                    ),
                                  ),
                                )

                              ],
                            ),
                          )

                        ],
                      ),
                    )
                  );
                },
childCount: 1,
              ),
            )
          ],
        ),

        expandableContent: Container(
          height: 200,

        ),
        persistentContentHeight: 50.0,
      )
      */
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            stretch: true,
            backgroundColor: Colors.yellowAccent,
            title: Text('data'),
            flexibleSpace: FlexibleSpaceBar(
              background: CustomCacheImage(
                imageUrl: widget.filmModelList!.poster,
                radius: 10,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  height: 50,
                  child: Text('data $index'),
                );
              },
              childCount: 50,
            ),
          )

        ],
      ),

      // body: StickyHeader(
      //   header: Container(
      //     height: 50.0,
      //     color: Colors.blueGrey[700],
      //     padding: EdgeInsets.symmetric(horizontal: 16.0),
      //     alignment: Alignment.centerLeft,
      //     child: CustomCacheImage(
      //       imageUrl: widget.filmModelList!.poster,
      //       radius: 10,
      //     ),
      //   ),
      //   content: Container(
      //     height: 200,
      //     child: Text('${widget.filmModelList!.title}')
      //   )
      //
      //
      // )

    );
  }
}
