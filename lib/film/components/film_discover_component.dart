import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/film/halaman/halaman_detail_film.dart';
import 'package:final_project/film/providers/film_get_discover_providers.dart';
import 'package:final_project/widget/item_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilmDiscoverComponent extends StatefulWidget {
  const FilmDiscoverComponent({super.key});

  @override
  State<FilmDiscoverComponent> createState() => _FilmDiscoverComponentState();
}

class _FilmDiscoverComponentState extends State<FilmDiscoverComponent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<FilmGetDiscoverProviders>();
      provider.getDiscover(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FilmGetDiscoverProviders>(
      builder: (_, provider, __) {
        if (provider.isLoading) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 300.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(12),
            ),
          );
        }

        if (provider.film.isNotEmpty) {
          return CarouselSlider.builder(
            itemCount: provider.film.length,
            itemBuilder: (_, index, __) {
              final film = provider.film[index];
              return ItemFilmWidget(
                film: film,
                heightBackdrop: 300.0,
                widthBackdrop: double.infinity,
                heightPoster: 160,
                widthPoster: 100,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) {
                      return HalamanDetailFilm(id: film.id);
                    },
                  ));
                },
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
          );
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          height: 300.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              'Tidak ditemukan',
              style: TextStyle(color: Colors.black45),
            ),
          ),
        );
      },
    );
  }
}
