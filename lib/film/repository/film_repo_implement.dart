import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/film/models/model_film.dart';
import 'package:final_project/film/repository/film_repo.dart';

class FilmRepositoryImplement implements FilmRepository {
  final Dio _dio;

  FilmRepositoryImplement(this._dio);

  @override
  Future<Either<String, ModelFilmResponse>> getDiscover({int page = 1}) async {
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
  Future<Either<String, ModelFilmResponse>> getTopRated({int page = 1}) async {
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
}
