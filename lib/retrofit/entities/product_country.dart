import 'package:json_annotation/json_annotation.dart';

part 'product_country.g.dart';

@JsonSerializable()
class ProductionCountry {
  String iso_3166_1;
  String name;

  ProductionCountry(this.iso_3166_1, this.name);

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}
