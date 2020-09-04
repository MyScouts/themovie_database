// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) {
  return ProductionCountry(
    json['iso_3166_1'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$ProductionCountryToJson(ProductionCountry instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso_3166_1,
      'name': instance.name,
    };
