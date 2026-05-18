// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RepositoryModel _$RepositoryModelFromJson(Map<String, dynamic> json) =>
    _RepositoryModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      visibility: json['visibility'] as String,
      url: json['html_url'] as String,
      issues: (json['open_issues_count'] as num).toInt(),
      updatedAt: DateTime.parse(json['pushed_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      stars: (json['stargazers_count'] as num).toInt(),
      descriptions: json['descriptions'] as String?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$RepositoryModelToJson(_RepositoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'visibility': instance.visibility,
      'html_url': instance.url,
      'open_issues_count': instance.issues,
      'pushed_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'stargazers_count': instance.stars,
      'descriptions': instance.descriptions,
      'language': instance.language,
    };
