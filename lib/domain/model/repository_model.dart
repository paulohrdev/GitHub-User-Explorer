import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_model.freezed.dart';
part 'repository_model.g.dart';

@freezed
abstract class RepositoryModel with _$RepositoryModel {
  const factory RepositoryModel({
    required int id,
    required String name,
    required String visibility,
    @JsonKey(name: 'html_url') required String url,
    @JsonKey(name: 'open_issues_count') required int issues,
    @JsonKey(name: 'pushed_at') required DateTime updatedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'stargazers_count') required int stars,
    String? descriptions,
    String? language,
  }) = _RepositoryModel;

  factory RepositoryModel.fromJson(Map<String, dynamic> json) =>
      _$RepositoryModelFromJson(json);
}