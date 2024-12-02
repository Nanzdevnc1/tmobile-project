import 'package:final_project/film/models/model_film.dart';
import 'package:final_project/film/repository/film_repo.dart';
import 'package:flutter/material.dart';

class FilmSearchProvider with ChangeNotifier {
  final FilmRepository _filmRepository;

  FilmSearchProvider(this._filmRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<ModelFilm> _film = [];
  List<ModelFilm> get film => _film;

  void search(BuildContext context, {required String query}) async {
    _isLoading = true;
    notifyListeners();

    final result = await _filmRepository.search(query: query);

    result.fold(
      (pesanError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(pesanError),
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
