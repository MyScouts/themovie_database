import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';
import 'package:themovie_database/retrofit/entities/list_video.dart';
import 'package:themovie_database/retrofit/entities/video.dart';
import 'package:themovie_database/retrofit/entities/movie.dart';
import 'package:themovie_database/retrofit/entities/movie_detail.dart';

part 'res_client.g.dart';

@RestApi(baseUrl: 'http://api.themoviedb.org/3/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('movie/{id}/videos')
  Future<Video> getVideoMovieId(
      @Path('id') int id, @Query('api_key') String apiKey);

  @GET('movie/{id}/videos')
  Future<ListVideo> getListVideoMovieId(
      @Path('id') int id, @Query('api_key') String apiKey);

  @GET('movie/{category}')
  Future<List<Movie>> getAllVideoWithCategory(
      @Path('category') String category, @Query('api_key') String apiKey);

  // @Path("id") int id);
  @GET('movie/{id}')
  Future<MoviewDetail> getMovidetail(
      @Path('id') int id, @Query('api_key') String api_key);
}
