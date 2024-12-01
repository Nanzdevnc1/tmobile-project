import 'package:final_project/film/models/model_detail_film.dart';
import 'package:final_project/film/repository/film_repo.dart';
import 'package:flutter/material.dart';

class FilmGetDetailProvider with ChangeNotifier {
  final FilmRepository _filmRepository;

  FilmGetDetailProvider(this._filmRepository);

  ModelDetailFilm? _film;
  ModelDetailFilm? get film => _film;

  void getDetail(BuildContext context, {required int id}) async {
    _film = null;
    notifyListeners();

    final result = await _filmRepository.getDetailFilm(id: id);
    result.fold(
      (pesanError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(pesanError)),
        );
        _film = null;
        notifyListeners();
        return;
      },
      (response) {
        _film = response;
        notifyListeners();
        return;
      },
    );
  }
}
