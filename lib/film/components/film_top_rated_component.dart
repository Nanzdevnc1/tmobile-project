import 'package:final_project/film/providers/film_get_top_rated_providers.dart';
import 'package:final_project/widget/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilmPopularComponent extends StatefulWidget {
  const FilmPopularComponent({super.key});

  @override
  State<FilmPopularComponent> createState() => _FilmPopularComponentState();
}

class _FilmPopularComponentState extends State<FilmPopularComponent> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final provider = context.read<FilmGetPopularProviders>();
      if (provider != null) {
        provider.getTopRated(context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: Consumer<FilmGetPopularProviders>(
          builder: (_, provider, __) {
            if (provider.isLoading) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(12.0)
                ),
              );
            }

            if (provider.movies.isNotEmpty) {
              return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return ImageNetworkWidget(
                        imageSrc: provider.movies[index].posterPath,
                        height: 200,
                        width: 120,
                        radius: 12.0,
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
                  child: Center(child: const Text('Film Top Rated tidak ditemukan')),
                );
              
            
             
          },
        ),
      ),
    );
  }
}