import 'package:final_project/film/providers/film_get_detail_provider.dart';
import 'package:final_project/injector.dart';
import 'package:final_project/widget/halaman_webview.dart';
import 'package:final_project/widget/item_movie_widget.dart';
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
            slivers: [_WidgetAppBar(context), _wWidgetSummary()]),
      ),
    );
  }
}

class _WidgetAppBar extends SliverAppBar {
  final BuildContext context;

  _WidgetAppBar(this.context);

  @override
  Color? get backgroundColor => Colors.white;

  @override
  Color? get foregroundColor => Colors.black;

  @override
  Widget? get leading => Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
      );

  @override
  List<Widget>? get actions => [
        Consumer<FilmGetDetailProvider>(
          builder: (_, provider, __) {
            final film = provider.film;

            if (film != null) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => WebViewWidget(
                                    title: film.title,
                                    url: film.homepage,
                                  )));
                    },
                    icon: const Icon(Icons.public),
                  ),
                ),
              );
            }
            return SizedBox();
          },
        ),
      ];

  @override
  double? get expandedHeight => 300;

  @override
  Widget? get flexibleSpace => Consumer<FilmGetDetailProvider>(
        builder: (_, provider, __) {
          final film = provider.film;

          if (film != null) {
            return ItemFilmWidget(
              detailFilm: film,
              heightBackdrop: double.infinity,
              widthBackdrop: double.infinity,
              heightPoster: 160.0,
              widthPoster: 100.0,
              radius: 0,
            );
          }
          return Container(
            color: Colors.black12,
            height: double.infinity,
            width: double.infinity,
          );
        },
      );
}

class _wWidgetSummary extends SliverToBoxAdapter {
  Widget _konten({required String title, required Widget body}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          body,
          const SizedBox(height: 12.0),
        ],
      );

  TableRow _tabelKonten({required String title, required String content}) =>
      TableRow(children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(content),
        )
      ]);

  @override
  Widget? get child => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<FilmGetDetailProvider>(
          builder: (_, provider, __) {
            final film = provider.film;

            if (film != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _konten(
                    title: 'Release Date',
                    body: Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_rounded,
                          size: 32.0,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          film.releaseDate.toString().split(' ').first,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ],
                    ),
                  ),
                  _konten(
                    title: 'Genres',
                    body: Wrap(
                      spacing: 6,
                      children: film.genres
                          .map((genre) => Chip(label: Text(genre.name)))
                          .toList(),
                    ),
                  ),
                  _konten(title: 'Overview', body: Text(film.overview)),
                  _konten(
                      title: 'Summary',
                      body: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(2),
                        },
                        border: TableBorder.all(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        children: [
                          _tabelKonten(
                              title: 'Adult',
                              content: film.adult ? "Yes" : "No"),
                          _tabelKonten(
                            title: 'Popularity',
                            content: '${film.popularity}',
                          ),
                          _tabelKonten(
                            title: 'Status',
                            content: film.status,
                          ),
                          _tabelKonten(
                            title: 'Budget',
                            content: '${film.budget}',
                          ),
                          _tabelKonten(
                            title: 'Revenue',
                            content: '${film.revenue}',
                          ),
                          _tabelKonten(
                            title: 'Tagline',
                            content: film.tagline,
                          ),
                        ],
                      )),
                ],
              );
            }
            return Container();
          },
        ),
      );
}
