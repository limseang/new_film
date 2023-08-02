

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../data/model/language_model.dart';

class AppConstants {
  // static const String THEME = 'wp_theme_theme';
  static const String APP_NAME = "Cinema Magic KH";
  static const String BASE_URL = "https://cinemagickh.com/api";
  static const String APP_ICON = "assets/image/library.png";
  static const String APP_VERSION = "1.0.0";
  static const String CHECK_VERSION = "version";
  static Color appColor = Colors.deepPurpleAccent;




  static const String TOKEN = 'token';
  static const String UUID = 'uuid';
  static const String LOGO = 'assets/images/logo_white.png';




 /* user */
  static const String REGISTER = "register";
  static const String LOGIN = "login";
  static const String AVATAR = "user/add/avatar";
  static const String USERINFO = "user/info";
  static const String DELETE_ACCOUNT = "user/delete/";
  static const String LOGOUT = "logout";
  static const String UPDATE_PROFILE = "user/update";

  /* ADMIN */
  static const String ALL_USER = "all/user";

  static const appOpenCount = 'appOpenCount';



  static const String ARTICALS = "artical";
  static const String SUB_CATEGORY = "sub-category";
  static const String ARTICAL_BY_SUB_CATEGORY = "sub_category/showartical/";
  static const String CATEGORY = "category";
  static const String LIKE = "like/create/";
  static const String GET_LIKE = "like/find/";
  static const String UNLIKE = "like/delete/";


  /* Actor */

  static const String CREATE_ACTOR = "artist/create";
  static const String GET_ACTOR = "artist";

  /* Film */

  static const String CREATE_FILM = "film/create";
  static const String GET_FILM = "film";







}




