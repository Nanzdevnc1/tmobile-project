import 'package:final_project/film/halaman/halaman_utama.dart';
import 'package:final_project/widget/item_movie_widget.dart';
import 'package:provider/provider.dart';
import 'package:final_project/film/models/model_film.dart';
import 'package:final_project/film/providers/film_get_discover_providers.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HalamanPaginasiFilm extends StatefulWidget {
  const HalamanPaginasiFilm({super.key});

  @override
  State<HalamanPaginasiFilm> createState() => _HalamanPaginasiFilmState();
}

class _HalamanPaginasiFilmState extends State<HalamanPaginasiFilm> {
  final PagingController<int, ModelFilm> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      final provider = context.read<FilmGetDiscoverProviders>();
      if (provider != null) {
        provider.getDiscoverWithPaging(
          context,
          pagingController: _pagingController,
          page: pageKey,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Film'),
      ),
      body: PagedListView.separated(
        padding: const EdgeInsets.all(16.0),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<ModelFilm>(
          itemBuilder: (context, item, index) => ItemFilmWidget(
            film: item,
            heightBackdrop: 260.0,
            widthBackdrop: double.infinity,
            heightPoster: 140.0,
            widthPoster: 80.0,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
