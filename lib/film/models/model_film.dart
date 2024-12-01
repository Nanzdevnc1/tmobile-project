import 'dart:convert';

ModelFilmResponse modelFilmResponseFromJson(String str) => ModelFilmResponse.fromJson(json.decode(str));

String modelFilmResponseToJson(ModelFilmResponse data) => json.encode(data.toJson());

class ModelFilmResponse {
    int page;
    List<ModelFilm> results;
    int totalPages;
    int totalResults;

    ModelFilmResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory ModelFilmResponse.fromJson(Map<String, dynamic> json) => ModelFilmResponse(
        page: json["page"] ?? 0,
        results: List<ModelFilm>.from(json["results"].map((x) => ModelFilm.fromJson(x ?? {}))),
        totalPages: json["total_pages"] ?? 0,
        totalResults: json["total_results"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class ModelFilm {
    String backdropPath;
    int id;
    String originalTitle;
    String overview;
    double popularity;
    String posterPath;
    DateTime releaseDate;
    String title;
    double voteAverage;
    int voteCount;

    ModelFilm({
        required this.backdropPath,
        required this.id,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.voteAverage,
        required this.voteCount,
    });

    factory ModelFilm.fromJson(Map<String, dynamic> json) => ModelFilm(
        backdropPath: json["backdrop_path"] ?? '', // Pastikan tidak null
        id: json["id"] ?? 0,
        originalTitle: json["original_title"] ?? 'No Title',
        overview: json["overview"] ?? 'No Overview',
        popularity: json["popularity"]?.toDouble() ?? 0.0,
        posterPath: json["poster_path"] ?? '',
        releaseDate: json["release_date"] != null ? DateTime.parse(json["release_date"]) : DateTime(2000),
        title: json["title"] ?? 'No Title',
        voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
        voteCount: json["vote_count"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

enum OriginalLanguage {
    EN,
    ES,
    TE,
    TL
}

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "es": OriginalLanguage.ES,
    "te": OriginalLanguage.TE,
    "tl": OriginalLanguage.TL
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
