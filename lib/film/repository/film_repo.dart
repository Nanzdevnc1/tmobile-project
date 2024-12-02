import 'package:dartz/dartz.dart';
import 'package:final_project/film/models/model_detail_film.dart';
import 'package:final_project/film/models/model_film.dart';

abstract class FilmRepository {
  Future<Either<String, ModelFilmResponse>> getDiscover ({int page = 1});
  Future<Either<String, ModelFilmResponse>> getTopRated ({int page = 1});
  Future<Either<String, ModelFilmResponse>> getNowPlaying ({int page = 1});
  Future<Either<String, ModelFilmResponse>> search ({required String query});
  Future<Either<String, ModelDetailFilm>> getDetailFilm ({required int id});
}