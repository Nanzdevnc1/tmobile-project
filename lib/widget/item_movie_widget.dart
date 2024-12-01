import 'package:final_project/film/models/model_detail_film.dart';
import 'package:final_project/film/models/model_film.dart';
import 'package:final_project/widget/image_widget.dart';
import 'package:flutter/material.dart';

class ItemFilmWidget extends Container {
  final ModelFilm? film;
  final ModelDetailFilm? detailFilm;
  final double heightBackdrop;
  final double widthBackdrop;
  final double heightPoster;
  final double widthPoster;
  final double radius;
  final void Function()? onTap;

  ItemFilmWidget({
    required this.heightBackdrop,
    required this.widthBackdrop,
    required this.heightPoster,
    required this.widthPoster,
    this.radius = 12,
    this.film,
    this.detailFilm,
    this.onTap,
  });

  @override
  Clip get clipBehavior => Clip.hardEdge;

  @override
  Decoration? get decoration => BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      );

  @override
  Widget? get child => Stack(
        children: [
          ImageNetworkWidget(
            imageSrc:
                '${detailFilm != null ? detailFilm!.backdropPath : film!.backdropPath}',
            height: heightBackdrop,
            width: widthBackdrop,
          ),
          Container(
            height: heightBackdrop,
            width: widthBackdrop,
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
                  imageSrc:
                      '${detailFilm != null ? detailFilm!.posterPath : film!.backdropPath}',
                  height: heightPoster,
                  width: widthPoster,
                  radius: 14,
                ),
                const SizedBox(height: 8),
                Text(
                  '${detailFilm != null ? detailFilm!.title : film!.title}',
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
                      '${detailFilm != null ? detailFilm!.voteAverage : film!.voteAverage} (${detailFilm != null ? detailFilm!.voteCount : film!.voteCount})',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned.fill(
              child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
            ),
          ))
        ],
      );
}
