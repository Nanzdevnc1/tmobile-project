import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/film/components/film_discover_component.dart';
import 'package:final_project/film/components/film_now_playing_component.dart';
import 'package:final_project/film/components/film_top_rated_component.dart';
import 'package:final_project/film/halaman/halaman_paginasi_film.dart';
import 'package:final_project/film/models/model_film.dart';
import 'package:final_project/film/providers/film_get_discover_providers.dart';
import 'package:final_project/film/providers/film_get_top_rated_providers.dart';
import 'package:final_project/widget/image_widget.dart';
import 'package:final_project/widget/item_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HalamanFilm extends StatelessWidget {
  const HalamanFilm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
  slivers: [
    SliverAppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset('assets/images/icon.png'),
            ),
          ),
          Text('Filmio'),
        ],
      ),
      floating: true,
      snap: true,
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    _WidgetTitle(
      title: 'Discover Film',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const HalamanPaginasiFilm(type: TipeFilm.discover),
          ),
        );
      },
    ),
    SliverToBoxAdapter(
      child: FilmDiscoverComponent(),
    ),
    _WidgetTitle(
      title: 'Popular Film',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const HalamanPaginasiFilm(type: TipeFilm.top_rated),
          ),
        );
      },
    ),
    SliverToBoxAdapter(
      child: FilmTopRatedComponent(),
    ),
    _WidgetTitle(
      title: 'Now Playing Film',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const HalamanPaginasiFilm(type: TipeFilm.nowPlaying),
          ),
        );
      },
    ),
    SliverToBoxAdapter(
      child: FilmNowPlayingComponent(),
    ),
  ],
)

    );
  }
}

class _WidgetTitle extends SliverToBoxAdapter {
  final String title;
  final void Function() onPressed;

  const _WidgetTitle({required this.title, required this.onPressed});

  @override
  Widget? get child => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                shape: const StadiumBorder(),
                side: const BorderSide(
                  color: Colors.black54,
                ),
              ),
              child: Text('Lihat yang lain'),
            )
          ],
        ),
      );
}