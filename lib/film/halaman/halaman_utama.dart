import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_project/film/halaman/halaman_paginasi_film.dart';
import 'package:final_project/film/halaman/halaman_search_film.dart';
import 'package:final_project/film/components/film_discover_component.dart';
import 'package:final_project/film/components/film_top_rated_component.dart';
import 'package:final_project/film/components/film_now_playing_component.dart';

class HalamanFilm extends StatelessWidget {
  const HalamanFilm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.amber, Colors.black, Colors.white],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start, 
                children: [
                  CircleAvatar(
                    radius: 20, 
                    backgroundColor: Colors.transparent, 
                    backgroundImage: AssetImage('assets/images/icon.png'),
                  ),
                  SizedBox(width: 10), 
                  Text(
                    'Filmio',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () => showSearch(
                    context: context,
                    delegate: HalamanSearchFilm(),
                  ),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
              floating: true,
              snap: true,
              centerTitle: false,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
            ),
            _WidgetTitle(
              title: 'Discover Film',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const HalamanPaginasiFilm(type: TipeFilm.discover),
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
                    builder: (_) =>
                        const HalamanPaginasiFilm(type: TipeFilm.top_rated),
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
                    builder: (_) =>
                        const HalamanPaginasiFilm(type: TipeFilm.nowPlaying),
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: FilmNowPlayingComponent(),
            ),
          ],
        ),
      ),
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
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white),
            ),
            OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                side: const BorderSide(
                  color: Colors.white,
                ),
              ),
              child: const Text('See More'),
            ),
          ],
        ),
      );
}
