import 'package:flutter/material.dart';
import 'package:themovie_database/screens/home.dart';
import 'package:themovie_database/screens/watch_movie/watch_movie_ui.dart';
import 'screens/detail_movie_screen/detail_movie.dart';

main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/detail_movie': (context) => DetailMovie(),
        '/': (context) => HomeScreen(),
        '/watch_movie': (context) => WatchMovieUI(),
      },
    ));
