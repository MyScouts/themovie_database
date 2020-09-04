import 'package:json_annotation/json_annotation.dart';

part 'list_video.g.dart';

@JsonSerializable()
class ListVideo {
  var id;
  String iso_639_1;
  String iso_3166_1;
  String key;
  String name;
  String site;
  var size;
  String type;

  ListVideo(this.id, this.iso_639_1, this.iso_3166_1, this.key, this.name,
      this.site, this.size, this.type);

  factory ListVideo.fromJson(Map<String, dynamic> json) =>
      _$ListVideoFromJson(json);

  Map<String, dynamic> toJson() => _$ListVideoToJson(this);
}
