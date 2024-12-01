import 'package:meta/meta.dart';
import 'dart:convert';

class ModelDetailFilm {
    final bool adult;
    final String backdropPath;
    final int budget;
    final List<Genre> genres;
    final String homepage;
    final int id;
    final String overview;
    final double popularity;
    final String posterPath;
    final DateTime releaseDate;
    final int revenue;
    final String status;
    final String tagline;
    final String title;
    final double voteAverage;
    final int voteCount;

    ModelDetailFilm({
        required this.adult,
        required this.backdropPath,
        required this.budget,
        required this.genres,
        required this.homepage,
        required this.id,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.revenue,
        required this.status,
        required this.tagline,
        required this.title,
        required this.voteAverage,
        required this.voteCount,
    });

    factory ModelDetailFilm.fromRawJson(String str) => ModelDetailFilm.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ModelDetailFilm.fromJson(Map<String, dynamic> json) => ModelDetailFilm(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"] ?? '',
        budget: json["budget"] ?? 0,
        genres: List<Genre>.from(json["genres"]?.map((x) => Genre.fromJson(x)) ?? []),
        homepage: json["homepage"] ?? '',
        id: json["id"] ?? 0,
        overview: json["overview"] ?? 'No Overview',
        popularity: json["popularity"]?.toDouble() ?? 0.0,
        posterPath: json["poster_path"] ?? '',
        releaseDate: json["release_date"] != null ? DateTime.parse(json["release_date"]) : DateTime(2000),
        revenue: json["revenue"] ?? 0,
        status: json["status"] ?? '',
        tagline: json["tagline"] ?? '',
        title: json["title"] ?? 'No Title',
        voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
        voteCount: json["vote_count"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "budget": budget,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "status": status,
        "tagline": tagline,
        "title": title,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

class Genre {
    final int id;
    final String name;

    Genre({
        required this.id,
        required this.name,
    });

    factory Genre.fromRawJson(String str) => Genre.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"] ?? 0,
        name: json["name"] ?? 'Unknown',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
