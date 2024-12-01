import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/film/halaman/halaman_paginasi_film.dart';
import 'package:final_project/film/models/model_film.dart';
import 'package:final_project/film/providers/film_get_discover_providers.dart';
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
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discover Film',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HalamanPaginasiFilm(),
                        ),
                      );
                    },
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
            ),
          ),
          WidgetDiscoverFilm(),
        ],
      ),
    );
  }
}

class WidgetDiscoverFilm extends StatefulWidget {
  const WidgetDiscoverFilm({super.key});

  @override
  State<WidgetDiscoverFilm> createState() => _WidgetDiscoverFilmState();
}

class _WidgetDiscoverFilmState extends State<WidgetDiscoverFilm> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final provider = context.read<FilmGetDiscoverProviders>();
      if (provider != null) {
        provider.getDiscover(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FilmGetDiscoverProviders>(
      builder: (_, provider, __) {
        if (provider.isLoading) {
          return SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              height: 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }

        if (provider.film.isNotEmpty) {
          return SliverToBoxAdapter(
            child: CarouselSlider.builder(
              itemCount: provider.film.length,
              itemBuilder: (_, index, __) {
                final film = provider.film[index];
                return ItemFilmWidget(
                  film: film,
                  heightBackdrop: 300.0,
                  widthBackdrop: double.infinity,
                  heightPoster: 160,
                  widthPoster: 100,
                );
              },
              options: CarouselOptions(
                height: 300.0,
                viewportFraction: 0.8,
                reverse: false,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
        }

        return SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            height: 300.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Tidak ditemukan',
                style: TextStyle(color: Colors.black45),
              ),
            ),
          ),
        );
      },
    );
  }
}
