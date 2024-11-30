import 'package:dartz/dartz.dart';
import 'package:final_project/film/models/model_film.dart';

abstract class FilmRepository {
  Future<Either<String, ModelFilmResponse>> getDiscover ({int page = 1});
}