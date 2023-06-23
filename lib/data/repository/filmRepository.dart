import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';

class FilmRepository {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  String? token;
  FilmRepository({required this.dioClient, required this.sharedPreferences});

  Future getFilm() async {
    try {
      var response = await dioClient.getData(
        'film',
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

}
