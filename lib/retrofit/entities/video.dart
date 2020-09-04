import 'package:json_annotation/json_annotation.dart';
import 'package:themovie_database/retrofit/entities/list_video.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
  int id;
  List<ListVideo> results;

  Video(this.id, this.results);

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}
