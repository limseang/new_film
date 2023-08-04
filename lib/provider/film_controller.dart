import 'package:film_admin/data/model/filmModel.dart';
import 'package:get/get.dart';

import '../data/repository/filmRepository.dart';

class FilmController extends GetxController implements GetxService {
  final FilmRepository filmRepo;
  FilmController({required this.filmRepo});
  @override
  void onInit() {
    super.onInit();
  }

  FilmModel? _filmModel;
  List<FilmModelList> ? _filmModelList = [];


  FilmModel? get filmModel => _filmModel;
  List<FilmModelList> ? get filmModelList => _filmModelList;

  Future getFilm() async{
    try{
      var response = await filmRepo.getFilm();
      if (response.statusCode == 200) {
        var body = response.body;
        _filmModel = FilmModel.fromJson(body);
        _filmModelList = _filmModel!.data;
        update();
      }
      return response.statusCode;
    }catch(e){
      print(e);
    }
  }

  Future rateFilm({int? film_id, int? rate})async {
    try{
      var response = await filmRepo.rateFilm(film_id: film_id, rate: rate);
      if (response.statusCode == 200) {
        var body = response.body;
        _filmModel = FilmModel.fromJson(body);
        _filmModelList = _filmModel!.data;
        update();
      }
      return response.statusCode;
    }catch(e){
      print(e);
    }
  }


}