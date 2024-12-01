import 'package:dio/dio.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/film/providers/film_get_detail_provider.dart';
import 'package:final_project/film/providers/film_get_discover_providers.dart';
import 'package:final_project/film/providers/film_get_now_playing_providers.dart';
import 'package:final_project/film/providers/film_get_top_rated_providers.dart';
import 'package:final_project/film/repository/film_repo.dart';
import 'package:final_project/film/repository/film_repo_implement.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setup() {
  serviceLocator.registerFactory<FilmGetDiscoverProviders>(
    () => FilmGetDiscoverProviders(serviceLocator()),
  );
  serviceLocator.registerFactory<FilmGetTopRatedProviders>(
    () => FilmGetTopRatedProviders(serviceLocator()),
  );
  serviceLocator.registerFactory<FilmGetNowPlayingProviders>(
    () => FilmGetNowPlayingProviders(serviceLocator()),
  );
  serviceLocator.registerFactory<FilmGetDetailProvider>(
    () => FilmGetDetailProvider(serviceLocator()),
  );

  serviceLocator.registerLazySingleton<FilmRepository>(
      () => FilmRepositoryImplement(serviceLocator()));

  serviceLocator.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: Constant.base_url,
        queryParameters: {'api_key': Constant.api_key},
      ),
    ),
  );
}
