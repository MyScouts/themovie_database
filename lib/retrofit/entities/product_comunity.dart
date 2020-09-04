import 'package:json_annotation/json_annotation.dart';

part 'product_comunity.g.dart';

@JsonSerializable()
class ProductionCompany {
  int id;

  // ignore: non_constant_identifier_names
  String logo_path;
  String name;

  // ignore: non_constant_identifier_names
  String origin_country;

  ProductionCompany(this.id, this.logo_path, this.name, this.origin_country);

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}
