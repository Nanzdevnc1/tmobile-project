import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/film/models/model_film.dart';
import 'package:final_project/film/providers/film_get_discover_providers.dart';
import 'package:final_project/widget/image_widget.dart';
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
                    )),
                Text('Filmio'),
              ],
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          SliverToBoxAdapter(
            // Tambahkan ini
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discover Film',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  OutlinedButton(
                    onPressed: () {},
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FilmGetDiscoverProviders>().getDiscover(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<FilmGetDiscoverProviders>(
        builder: (_, provider, __) {
          if (provider.isLoading) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              height: 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(12)),
            );
          }

          if (provider.film.isNotEmpty) {
            return CarouselSlider.builder(
              itemCount: provider.film.length,
              itemBuilder: (_, index, __) {
                final film = provider.film[index];
                return ItemFilm(film);
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
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            height: 300.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                'Tidak ditemukan',
                style: TextStyle(color: Colors.black45),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemFilm extends Container {
  final ModelFilm film;

  ItemFilm(this.film);

  @override
  // TODO: implement clipBehavior
  Clip get clipBehavior => Clip.hardEdge;

  @override
  Decoration? get decoration => BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      );

  @override
  Widget? get child => Stack(
        children: [
          ImageNetworkWidget(
            imageSrc: '${film.backdropPath}',
            height: 300.0,
            width: double.infinity,
          ),
          Container(
            height: 300.0,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black87,
                  ]),
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageNetworkWidget(
                  imageSrc: '${film.posterPath}',
                  height: 160.0,
                  width: 100,
                  radius: 14,
                ),
                const SizedBox(height: 8),
                Text(
                  film.title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                    Text(
                      '${film.voteAverage} (${film.voteCount})',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );
}
