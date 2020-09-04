import 'package:json_annotation/json_annotation.dart';

part 'spoken_language.g.dart';

@JsonSerializable()
class SpokenLanguage {
  String iso_639_1;
  String name;

  SpokenLanguage(this.iso_639_1, this.name);

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJSon() => _$SpokenLanguageToJson(this);
}
