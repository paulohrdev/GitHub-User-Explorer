// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepositoryModel {

 String get name; String get visibility;@JsonKey(name: 'pushed_at') DateTime get updatedAt;@JsonKey(name: 'stargazers_count') int get stars; String? get descriptions; String? get language;
/// Create a copy of RepositoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepositoryModelCopyWith<RepositoryModel> get copyWith => _$RepositoryModelCopyWithImpl<RepositoryModel>(this as RepositoryModel, _$identity);

  /// Serializes this RepositoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepositoryModel&&(identical(other.name, name) || other.name == name)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.descriptions, descriptions) || other.descriptions == descriptions)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,visibility,updatedAt,stars,descriptions,language);

@override
String toString() {
  return 'RepositoryModel(name: $name, visibility: $visibility, updatedAt: $updatedAt, stars: $stars, descriptions: $descriptions, language: $language)';
}


}

/// @nodoc
abstract mixin class $RepositoryModelCopyWith<$Res>  {
  factory $RepositoryModelCopyWith(RepositoryModel value, $Res Function(RepositoryModel) _then) = _$RepositoryModelCopyWithImpl;
@useResult
$Res call({
 String name, String visibility,@JsonKey(name: 'pushed_at') DateTime updatedAt,@JsonKey(name: 'stargazers_count') int stars, String? descriptions, String? language
});




}
/// @nodoc
class _$RepositoryModelCopyWithImpl<$Res>
    implements $RepositoryModelCopyWith<$Res> {
  _$RepositoryModelCopyWithImpl(this._self, this._then);

  final RepositoryModel _self;
  final $Res Function(RepositoryModel) _then;

/// Create a copy of RepositoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? visibility = null,Object? updatedAt = null,Object? stars = null,Object? descriptions = freezed,Object? language = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,descriptions: freezed == descriptions ? _self.descriptions : descriptions // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RepositoryModel].
extension RepositoryModelPatterns on RepositoryModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RepositoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RepositoryModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RepositoryModel value)  $default,){
final _that = this;
switch (_that) {
case _RepositoryModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RepositoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _RepositoryModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String visibility, @JsonKey(name: 'pushed_at')  DateTime updatedAt, @JsonKey(name: 'stargazers_count')  int stars,  String? descriptions,  String? language)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RepositoryModel() when $default != null:
return $default(_that.name,_that.visibility,_that.updatedAt,_that.stars,_that.descriptions,_that.language);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String visibility, @JsonKey(name: 'pushed_at')  DateTime updatedAt, @JsonKey(name: 'stargazers_count')  int stars,  String? descriptions,  String? language)  $default,) {final _that = this;
switch (_that) {
case _RepositoryModel():
return $default(_that.name,_that.visibility,_that.updatedAt,_that.stars,_that.descriptions,_that.language);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String visibility, @JsonKey(name: 'pushed_at')  DateTime updatedAt, @JsonKey(name: 'stargazers_count')  int stars,  String? descriptions,  String? language)?  $default,) {final _that = this;
switch (_that) {
case _RepositoryModel() when $default != null:
return $default(_that.name,_that.visibility,_that.updatedAt,_that.stars,_that.descriptions,_that.language);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RepositoryModel implements RepositoryModel {
  const _RepositoryModel({required this.name, required this.visibility, @JsonKey(name: 'pushed_at') required this.updatedAt, @JsonKey(name: 'stargazers_count') required this.stars, this.descriptions, this.language});
  factory _RepositoryModel.fromJson(Map<String, dynamic> json) => _$RepositoryModelFromJson(json);

@override final  String name;
@override final  String visibility;
@override@JsonKey(name: 'pushed_at') final  DateTime updatedAt;
@override@JsonKey(name: 'stargazers_count') final  int stars;
@override final  String? descriptions;
@override final  String? language;

/// Create a copy of RepositoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RepositoryModelCopyWith<_RepositoryModel> get copyWith => __$RepositoryModelCopyWithImpl<_RepositoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RepositoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepositoryModel&&(identical(other.name, name) || other.name == name)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.descriptions, descriptions) || other.descriptions == descriptions)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,visibility,updatedAt,stars,descriptions,language);

@override
String toString() {
  return 'RepositoryModel(name: $name, visibility: $visibility, updatedAt: $updatedAt, stars: $stars, descriptions: $descriptions, language: $language)';
}


}

/// @nodoc
abstract mixin class _$RepositoryModelCopyWith<$Res> implements $RepositoryModelCopyWith<$Res> {
  factory _$RepositoryModelCopyWith(_RepositoryModel value, $Res Function(_RepositoryModel) _then) = __$RepositoryModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String visibility,@JsonKey(name: 'pushed_at') DateTime updatedAt,@JsonKey(name: 'stargazers_count') int stars, String? descriptions, String? language
});




}
/// @nodoc
class __$RepositoryModelCopyWithImpl<$Res>
    implements _$RepositoryModelCopyWith<$Res> {
  __$RepositoryModelCopyWithImpl(this._self, this._then);

  final _RepositoryModel _self;
  final $Res Function(_RepositoryModel) _then;

/// Create a copy of RepositoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? visibility = null,Object? updatedAt = null,Object? stars = null,Object? descriptions = freezed,Object? language = freezed,}) {
  return _then(_RepositoryModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,descriptions: freezed == descriptions ? _self.descriptions : descriptions // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
