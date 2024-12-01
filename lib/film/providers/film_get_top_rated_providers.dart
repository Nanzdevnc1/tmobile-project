import 'package:final_project/film/models/model_film.dart';
import 'package:final_project/film/repository/film_repo.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FilmGetPopularProviders with ChangeNotifier {
  final FilmRepository _filmRepository;

  FilmGetPopularProviders(this._filmRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<ModelFilm> _films = [];
  List<ModelFilm> get movies => _films;

  void getTopRated(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final result = await _filmRepository.getTopRated();

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
        _films.clear();
        _films.addAll(response.results);

        _isLoading = false;
        notifyListeners();
        return;
      },
    );
  }

  void getTopRatedWithPagination(
    BuildContext context, {
    required int page,
    required PagingController pagingController,
  }) async {
    final result = await _filmRepository.getTopRated();

    result.fold(
      (pesanError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(pesanError),
        ));

        pagingController.error = pesanError;

        return;
      },
      (response) {
        if (response.results.length < 20) {
          pagingController.appendLastPage(response.results);
        } else {
          pagingController.appendPage(response.results, page + 1);
        }
        return;
      },
    );
  }
}
