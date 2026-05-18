// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      id: (json['id'] as num).toInt(),
      login: json['login'] as String,
      followers: (json['followers'] as num).toInt(),
      following: (json['following'] as num).toInt(),
      repos: (json['public_repos'] as num).toInt(),
      avatarUrl: json['avatar_url'] as String,
      htmlUrl: json['html_url'] as String,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'followers': instance.followers,
      'following': instance.following,
      'public_repos': instance.repos,
      'avatar_url': instance.avatarUrl,
      'html_url': instance.htmlUrl,
      'name': instance.name,
      'bio': instance.bio,
    };
