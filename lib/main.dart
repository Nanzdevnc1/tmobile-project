import 'package:dio/dio.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/film/halaman/halaman_utama.dart';
import 'package:final_project/film/providers/film_get_discover_providers.dart';
import 'package:final_project/film/providers/film_get_now_playing_providers.dart';
import 'package:final_project/film/providers/film_get_top_rated_providers.dart';
import 'package:final_project/film/providers/film_search_provider.dart';
import 'package:final_project/film/repository/film_repo.dart';
import 'package:final_project/film/repository/film_repo_implement.dart';
import 'package:final_project/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  setup();

  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => serviceLocator<FilmGetDiscoverProviders>(),
          ),
          ChangeNotifierProvider(
            create: (_) => serviceLocator<FilmGetTopRatedProviders>(),
          ),
          ChangeNotifierProvider(
            create: (_) => serviceLocator<FilmGetNowPlayingProviders>(),
          ),
          ChangeNotifierProvider(
            create: (_) => serviceLocator<FilmSearchProvider>(),
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