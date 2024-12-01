import 'package:final_project/film/models/model_film.dart';
import 'package:final_project/film/repository/film_repo.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(pesanError)));

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

  void getDiscoverWithPaging(
    BuildContext context, {
    required PagingController pagingController,
    required int page,
  }) async {
    final result = await _filmRepository.getDiscover(page: page);
    result.fold(
      (pesanError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(pesanError)));

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
