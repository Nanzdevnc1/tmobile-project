import 'package:final_project/film/providers/film_get_now_playing_providers.dart';
import 'package:final_project/film/providers/film_get_top_rated_providers.dart';
import 'package:final_project/widget/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilmNowPlayingComponent extends StatefulWidget {
  const FilmNowPlayingComponent({super.key});

  @override
  State<FilmNowPlayingComponent> createState() =>
      _FilmNowPlayingComponentState();
}

class _FilmNowPlayingComponentState extends State<FilmNowPlayingComponent> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final provider = context.read<FilmGetNowPlayingProviders>();
      if (provider != null) {
        provider.getNowPlaying(context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: Consumer<FilmGetNowPlayingProviders>(
          builder: (_, provider, __) {
            if (provider.isLoading) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(12.0)),
              );
            }

            if (provider.movies.isNotEmpty) {
              return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final film = provider.movies[index];
                    return Container(
                      height: 200,
                      width: 300,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                          Colors.transparent,
                          Colors.black45,
                        ]),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageNetworkWidget(
                            imageSrc: film.posterPath,
                            height: 200,
                            width: 120,
                            radius: 12.0,
                          ),
                          const SizedBox(width: 8.0),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  film.title,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  film.overview,
                                  maxLines: 4,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemCount: provider.movies.length);
            }

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(12.0)),
              child:
                  Center(child: const Text('Film Now Playing tidak ditemukan')),
            );
          },
        ),
      ),
    );
  }
}