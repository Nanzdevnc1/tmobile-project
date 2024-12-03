import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/film/models/model_detail_film.dart';
import 'package:final_project/film/models/model_film.dart';
import 'package:final_project/film/repository/film_repo.dart';

class FilmRepositoryImplement implements FilmRepository {
  final Dio _dio;

  FilmRepositoryImplement(this._dio);

  @override
  Future<Either<String, ModelFilmResponse>> getDiscover({int page = 5}) async {
    try {
      final result = await _dio.get(
        '/discover/movie',
        queryParameters: {'page': page},
      );

      if (result.statusCode == 200 && result.data != null) {
        final model = ModelFilmResponse.fromJson(result.data);
        return Right(model);
      }

      return const Left('Error');
    } on DioError catch (e) {
      if (e.response != null) {
        return Left(e.response.toString());
      }

      return const Left('Eror lain');
    }

    // throw UnimplementedError();
  }

  @override
  Future<Either<String, ModelFilmResponse>> getTopRated({int page = 4}) async {
    try {
      final result = await _dio.get(
        '/movie/top_rated',
        queryParameters: {'page': page},
      );

      if (result.statusCode == 200 && result.data != null) {
        final model = ModelFilmResponse.fromJson(result.data);
        return Right(model);
      }

      return const Left('Error memanggil top film ');
    } on DioError catch (e) {
      if (e.response != null) {
        return Left(e.response.toString());
      }

      return const Left('Error lainnya');
    }
  }

  @override
  Future<Either<String, ModelFilmResponse>> getNowPlaying(
      {int page = 3}) async {
    try {
      final result = await _dio.get(
        '/movie/now_playing',
        queryParameters: {'page': page},
      );

      if (result.statusCode == 200 && result.data != null) {
        final model = ModelFilmResponse.fromJson(result.data);
        return Right(model);
      }

      return const Left('Error memanggil now playing film ');
    } on DioError catch (e) {
      if (e.response != null) {
        return Left(e.response.toString());
      }

      return const Left('Error lainnya');
    }
  }

  @override
  Future<Either<String, ModelDetailFilm>> getDetailFilm(
      {required int id}) async {
    try {
      final result = await _dio.get(
        '/movie/$id',
      );

      if (result.statusCode == 200 && result.data != null) {
        final model = ModelDetailFilm.fromJson(result.data);
        return Right(model);
      }

      return const Left('Error memanggil detail film film ');
    } on DioError catch (e) {
      if (e.response != null) {
        return Left(e.response.toString());
      }

      return const Left('Error lainnya');
    }
  }

  @override
  Future<Either<String, ModelFilmResponse>> search(
      {required String query}) async {
    try {
      final result = await _dio.get(
        '/search/movie',
        queryParameters: {"query" : query}
      );

      if (result.statusCode == 200 && result.data != null) {
        final model = ModelFilmResponse.fromJson(result.data);
        return Right(model);
      }

      return const Left('Error mencari film ');
    } on DioError catch (e) {
      if (e.response != null) {
        return Left(e.response.toString());
      }

      return const Left('Error lainnya');
    }
  }
}
