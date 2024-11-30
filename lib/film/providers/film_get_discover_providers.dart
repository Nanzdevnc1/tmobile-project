import 'package:final_project/film/models/model_film.dart';
import 'package:final_project/film/repository/film_repo.dart';
import 'package:flutter/material.dart';

class FilmGetDiscoverProviders with ChangeNotifier {
  final FilmRepository _filmRepository;

  FilmGetDiscoverProviders(this._filmRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<ModelFilm> _film = [];
  List<ModelFilm> get film => _film; 

  void getDiscover(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final result = await _filmRepository.getDiscover();
    result.fold(
      (pesanError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(pesanError)
        ));

        _isLoading = false;
        notifyListeners();
        return;
      },
      (response) {
        _film.clear();
        _film.addAll(response.results);

        _isLoading = false;
        notifyListeners();
        return;
      },
    );
  }
}
