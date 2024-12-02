import 'package:final_project/film/halaman/halaman_detail_film.dart';
import 'package:final_project/film/providers/film_search_provider.dart';
import 'package:final_project/widget/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HalamanSearchFilm extends SearchDelegate {
  @override
  String? get searchFieldLabel => "Search Film";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = "",
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black, backgroundColor: Colors.white));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
      color: Colors.black,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (query.isNotEmpty) {
        context.read<FilmSearchProvider>().search(context, query: query);
      }
    });

    return Consumer<FilmSearchProvider>(builder: (_, provider, __) {
      if (query.isEmpty) {
        return const Center(child: Text("Search Film"));
      }
      if (provider.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (provider.film.isEmpty) {
        return const Center(
          child: Text('Film tidak ditemukan'),
        );
      }

      // if(provider.film.isNotEmpty) {
      return ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (_, index) {
          final film = provider.film[index];
          return Stack(
            children: [
              Row(
                children: [
                  ImageNetworkWidget(
                    imageSrc: film.posterPath,
                    height: 120,
                    width: 80,
                    radius: 11,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          film.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          film.overview,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned.fill(
                  child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    close(context, null);
                    Navigator.push(context, MaterialPageRoute(
                      builder: (_) {
                        return HalamanDetailFilm(id: film.id);
                      },
                    ));
                  },
                ),
              ))
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: provider.film.length,
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text("Search Film"),
      );
    }

    // Menampilkan saran pencarian atau placeholder
    return Center(
      child: Text('Mengetik: $query'),
    );
  }
}
