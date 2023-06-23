//register articalcontroller

import 'dart:convert';

import 'package:film_admin/data/repository/actorRepositor.dart';
import 'package:film_admin/data/repository/articalRepository.dart';
import 'package:film_admin/data/repository/authRepo.dart';
import 'package:film_admin/data/repository/filmRepository.dart';
import 'package:film_admin/provider/actor_controller.dart';
import 'package:film_admin/provider/artical_controller.dart';
import 'package:film_admin/provider/auth_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api/api_client.dart';
import '../data/model/language_model.dart';
import '../provider/film_controller.dart';
import '../util/app_constants.dart';


Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  // Get.lazyPut(() => NetworkInfo(Get.find()));
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => DioClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  // Repository
  Get.lazyPut(() =>
      ArticalRepository(dioClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthReopsitory(dioClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => ActorRepository(dioClient: Get.find(), sharedPreferences: Get.find())); //register articalcontroller
  Get.lazyPut(() => FilmRepository(dioClient: Get.find(), sharedPreferences: Get.find())); //register filmcontroller

  // Controller
  Get.lazyPut(() => ActorController(actorRepo: Get.find())); //register articalcontroller
  Get.lazyPut(() => ArticalController(articalRepo: Get.find())); //register articalcontroller
  Get.lazyPut(() => AuthController(authRepo: Get.find(), sharedPreferences: Get.find())); //register authcontroller
  Get.lazyPut(() => FilmController(filmRepo: Get.find())); //register authcontroller



  Map<String, Map<String, String>> _languages = Map();
  return _languages;
}
