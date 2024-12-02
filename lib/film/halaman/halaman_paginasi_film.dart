import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:final_project/film/providers/film_get_discover_providers.dart';
import 'package:final_project/film/providers/film_get_top_rated_providers.dart';
import 'package:final_project/film/providers/film_get_now_playing_providers.dart';
import 'package:final_project/film/models/model_film.dart';
import 'package:final_project/widget/item_movie_widget.dart';

enum TipeFilm { discover, top_rated, nowPlaying }

class HalamanPaginasiFilm extends StatefulWidget {
  const HalamanPaginasiFilm({super.key, required this.type});

  final TipeFilm type;

  @override
  State<HalamanPaginasiFilm> createState() => _HalamanPaginasiFilmState();
}

class _HalamanPaginasiFilmState extends State<HalamanPaginasiFilm> {
  final PagingController<int, ModelFilm> _pagingController =
      PagingController(firstPageKey: 5);

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
                page: pageKey - 4,
              );
          break;
        case TipeFilm.nowPlaying:
          context.read<FilmGetNowPlayingProviders>().getNowPlayingWithPaging(
                context,
                pagingController: _pagingController,
                page: pageKey - 4,
              );
          break;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Colors.amber],
            ),
          ),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.white), // Mengubah warna ikon panah kembali menjadi putih
            title: Builder(
              builder: (_) {
                switch (widget.type) {
                  case TipeFilm.discover:
                    return const Text('Discover Film', style: TextStyle(color: Colors.white));
                  case TipeFilm.top_rated:
                    return const Text('Top Film', style: TextStyle(color: Colors.white));
                  case TipeFilm.nowPlaying:
                    return const Text('Now Playing Film', style: TextStyle(color: Colors.white));
                }
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.amber, Colors.black, Colors.white],
          ),
        ),
        child: PagedListView.separated(
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
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
