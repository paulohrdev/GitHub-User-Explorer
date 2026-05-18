// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RepositoryModel _$RepositoryModelFromJson(Map<String, dynamic> json) =>
    _RepositoryModel(
      name: json['name'] as String,
      visibility: json['visibility'] as String,
      updatedAt: DateTime.parse(json['pushed_at'] as String),
      stars: (json['stargazers_count'] as num).toInt(),
      descriptions: json['descriptions'] as String?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$RepositoryModelToJson(_RepositoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'visibility': instance.visibility,
      'pushed_at': instance.updatedAt.toIso8601String(),
      'stargazers_count': instance.stars,
      'descriptions': instance.descriptions,
      'language': instance.language,
    };
