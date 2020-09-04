// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_comunity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) {
  return ProductionCompany(
    json['id'] as int,
    json['logo_path'] as String,
    json['name'] as String,
    json['origin_country'] as String,
  );
}

Map<String, dynamic> _$ProductionCompanyToJson(ProductionCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logo_path,
      'name': instance.name,
      'origin_country': instance.origin_country,
    };
