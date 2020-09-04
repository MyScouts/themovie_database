import 'package:json_annotation/json_annotation.dart';
import 'package:themovie_database/retrofit/entities/product_comunity.dart';

import 'genre.dart';
import 'product_country.dart';
import 'spoken_language.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MoviewDetail {
  bool adult;

  // ignore: non_constant_identifier_names
  String backdrop_path;

  // ignore: non_constant_identifier_names
  var belongs_to_collection;
  int budget;
  List<Genre> genres;
  var homepage;
  int id;

  // ignore: non_constant_identifier_names
  String imdb_id;

  // ignore: non_constant_identifier_names
  String original_language;

  // ignore: non_constant_identifier_names
  String original_title;
  String overview;
  var popularity;

  // ignore: non_constant_identifier_names
  String poster_path;

  // ignore: non_constant_identifier_names
  List<ProductionCompany> production_companies;

  // ignore: non_constant_identifier_names
  List<ProductionCountry> production_countries;

  // ignore: non_constant_identifier_names
  String release_date;

  int revenue;

  int runtime;

  // ignore: non_constant_identifier_names
  List<SpokenLanguage> spoken_languages;
  String status;

  String tagline;
  String title;
  bool video;

  // ignore: non_constant_identifier_names
  var vote_average;

  // ignore: non_constant_identifier_names
  int vote_count;

  MoviewDetail(
      this.adult,
      this.backdrop_path,
      this.belongs_to_collection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdb_id,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.production_companies,
      this.production_countries,
      this.release_date,
      this.revenue,
      this.runtime,
      this.spoken_languages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.vote_average,
      this.vote_count);

  factory MoviewDetail.fromJson(Map<String, dynamic> json) =>
      _$MoviewDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MoviewDetailToJson(this);
}
