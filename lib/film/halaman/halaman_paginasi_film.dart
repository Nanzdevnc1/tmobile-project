import 'package:final_project/film/halaman/halaman_utama.dart';
import 'package:final_project/film/providers/film_get_now_playing_providers.dart';
import 'package:final_project/film/providers/film_get_top_rated_providers.dart';
import 'package:final_project/widget/item_movie_widget.dart';
import 'package:provider/provider.dart';
import 'package:final_project/film/models/model_film.dart';
import 'package:final_project/film/providers/film_get_discover_providers.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

enum TipeFilm { discover, top_rated, nowPlaying }

class HalamanPaginasiFilm extends StatefulWidget {
  const HalamanPaginasiFilm({super.key, required this.type});

  final TipeFilm type;

  @override
  State<HalamanPaginasiFilm> createState() => _HalamanPaginasiFilmState();
}

class _HalamanPaginasiFilmState extends State<HalamanPaginasiFilm> {
  final PagingController<int, ModelFilm> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      switch (widget.type) {
        case TipeFilm.discover:
          context.read<FilmGetDiscoverProviders>().getDiscoverWithPaging(
                context,
                pagingController: _pagingController,
                page: pageKey,
              );
          break;
        case TipeFilm.top_rated:
          context.read<FilmGetTopRatedProviders>().getTopRatedWithPagination(
                context,
                pagingController: _pagingController,
                page: pageKey,
              );
          break;
        case TipeFilm.nowPlaying:
          context.read<FilmGetNowPlayingProviders>().getNowPlayingWithPaging(
                context,
                pagingController: _pagingController,
                page: pageKey,
              );
          break;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(
          builder: (_) {
            switch (widget.type) {
              case TipeFilm.discover:
                return const Text('Discover Film');
              case TipeFilm.top_rated:
                return const Text('Top Film');
              case TipeFilm.nowPlaying:
                return const Text('Now Playing Film');
            }
            
          }
        ),
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
