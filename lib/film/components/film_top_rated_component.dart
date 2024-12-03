import 'package:final_project/film/halaman/halaman_detail_film.dart';
import 'package:final_project/film/providers/film_get_top_rated_providers.dart';
import 'package:final_project/widget/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilmTopRatedComponent extends StatefulWidget {
  const FilmTopRatedComponent({super.key});

  @override
  State<FilmTopRatedComponent> createState() => _FilmTopRatedComponentState();
}

class _FilmTopRatedComponentState extends State<FilmTopRatedComponent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<FilmGetTopRatedProviders>();
      provider.getTopRated(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Consumer<FilmGetTopRatedProviders>(
        builder: (_, provider, __) {
          if (provider.isLoading) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(12.0),
              ),
            );
          }

          if (provider.movies.isNotEmpty) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final film = provider.movies[index]; 
                return Stack(
                  children: [
                    ImageNetworkWidget(
                      imageSrc: film.posterPath,
                      height: 200,
                      width: 120,
                      radius: 12.0,
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) {
                                  return HalamanDetailFilm(id: film.id);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemCount: provider.movies.length,
            );
          }

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Center(
              child: Text('Film Popular Rated tidak ditemukan'),
            ),
          );
        },
      ),
    );
  }
}
