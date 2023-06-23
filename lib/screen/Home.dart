import 'package:film_admin/screen/Auth/profile.dart';
import 'package:film_admin/screen/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/model/userModel.dart';
import 'film/Film.dart';


class homeScreen extends StatefulWidget {
  UserModel? userModel;

  homeScreen({Key? key, this.userModel }) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  bool _iscinema = false;
  int _currentIndex = 0;
  PageController _pageController = PageController();

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

    });
    _pageController.jumpToPage(index,
    );

  }
  List<IconData> iconList = [
    Icons.home,
    Icons.video_collection,
    Icons.people_sharp,
    Icons.person,
    // Feather.home,
    // Feather.youtube,
    // Feather.video,
    // Feather.user,
    // Feather.user
  ];
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        bottomNavigationBar: _bottomNavigationBar() ,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,

          children: [
            Artical(),
            filmScreen(),
            Container(
              child: Center(child: Text('Profile')),
            ),
            profileScreen(),

          ],

        ),
      ),
    );
  }
  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) => onTabTapped(index),
      currentIndex: _currentIndex,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      iconSize: 25,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(iconList[0]),
            label: 'home'

        ),
        BottomNavigationBarItem(
            icon: Icon(iconList[1]),
            label: 'film'

        ),
        BottomNavigationBarItem(
            icon: (FaIcon(FontAwesomeIcons.film,size: 25,)),
            label: 'cinema'

        ),
        BottomNavigationBarItem(
            icon: Icon(iconList[3]),
            label: 'profile'

        )
      ],
    );
  }
}
