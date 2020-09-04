import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:themovie_database/retrofit/entities/movie.dart';
import 'package:http/http.dart' as http;
import 'package:themovie_database/retrofit/entities/movie_detail.dart';
import 'package:themovie_database/retrofit/entities/list_video.dart';
import '../config.dart';

abstract class MovieDB {
  MovieDB();

  Future<List<Movie>> getAllMovie(String category);

  Future<MoviewDetail> getMovieById(int id);

  Future<ListVideo> getMovieVideosbyId(int id);

  factory MovieDB.getInstance() => _MovieRepository();
}

class _MovieRepository extends MovieDB {
  static List<Movie> _computeMovies(dynamic body) =>
      List<Movie>.from(body.map((movie) => Movie.fromJson(movie)));

  static List<ListVideo> _computeVideos(dynamic body) =>
      List<ListVideo>.from(body.map((video) => ListVideo.fromJson(video)));

  static final _MovieRepository _singleton = new _MovieRepository._internal();

  factory _MovieRepository() => _singleton;

  _MovieRepository._internal();

  @override
  Future<List<Movie>> getAllMovie(String category) async {
    var url = Uri.https(
        MOVIE_DB_BASE_URL, '/3/movie/$category', {'api_key': API_KEY});
    var response = await http.get(url);
    return compute(_computeMovies, json.decode(response.body)['results']);
  }

  @override
  Future<MoviewDetail> getMovieById(int id) async {
    var url =
        Uri.https(MOVIE_DB_BASE_URL, '/3/movie/$id', {'api_key': API_KEY});

    var response = await http.get(url);
    return MoviewDetail.fromJson(json.decode(response.body));
  }

  @override
  Future<ListVideo> getMovieVideosbyId(int id) async {
    var url = Uri.https(
        MOVIE_DB_BASE_URL, '/3/movie/$id/videos', {'api_key': API_KEY});
    var response = await http.get(url);
    return ListVideo.fromJson(json.decode(response.body));
  }
}
