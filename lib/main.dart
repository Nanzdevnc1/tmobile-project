import 'package:dio/dio.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/film/halaman/halaman_utama.dart';
import 'package:final_project/film/providers/film_get_discover_providers.dart';
import 'package:final_project/film/providers/film_get_top_rated_providers.dart';
import 'package:final_project/film/repository/film_repo.dart';
import 'package:final_project/film/repository/film_repo_implement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final dioOptions = BaseOptions(
    baseUrl: Constant.base_url,
    queryParameters: {'api_key': Constant.api_key},
  );

  final Dio dio = Dio(dioOptions);
  final FilmRepository filmRepository = FilmRepositoryImplement(dio);

  runApp( MyApp(filmRepository: filmRepository));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.filmRepository});

  final FilmRepository filmRepository;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => FilmGetDiscoverProviders(filmRepository),
          ),
          ChangeNotifierProvider(
            create: (_) => FilmGetPopularProviders(filmRepository),
          ),
        ],
        child: MaterialApp(
          title: 'Final Project Mobile',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HalamanFilm(),),);
  }
}