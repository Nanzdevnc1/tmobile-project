import 'package:final_project/film/providers/film_get_detail_provider.dart';
import 'package:final_project/injector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HalamanDetailFilm extends StatelessWidget {
  const HalamanDetailFilm({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          serviceLocator<FilmGetDetailProvider>()..getDetail(context, id: id),
      builder: (_, __) => Scaffold(
        body: CustomScrollView(
          slivers: [
            Consumer<FilmGetDetailProvider>(
              builder: (_, provider, __) {
                return SliverAppBar(
                  title: Text(
                    provider.film != null ? provider.film!.title : '',
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
