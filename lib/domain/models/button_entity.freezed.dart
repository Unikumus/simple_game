// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'button_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ButtonEntity {
  int get id => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  ButtonType get type => throw _privateConstructorUsedError;

  /// Create a copy of ButtonEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ButtonEntityCopyWith<ButtonEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ButtonEntityCopyWith<$Res> {
  factory $ButtonEntityCopyWith(
          ButtonEntity value, $Res Function(ButtonEntity) then) =
      _$ButtonEntityCopyWithImpl<$Res, ButtonEntity>;
  @useResult
  $Res call({int id, int count, ButtonType type});
}

/// @nodoc
class _$ButtonEntityCopyWithImpl<$Res, $Val extends ButtonEntity>
    implements $ButtonEntityCopyWith<$Res> {
  _$ButtonEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ButtonEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? count = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ButtonType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ButtonEntityImplCopyWith<$Res>
    implements $ButtonEntityCopyWith<$Res> {
  factory _$$ButtonEntityImplCopyWith(
          _$ButtonEntityImpl value, $Res Function(_$ButtonEntityImpl) then) =
      __$$ButtonEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int count, ButtonType type});
}

/// @nodoc
class __$$ButtonEntityImplCopyWithImpl<$Res>
    extends _$ButtonEntityCopyWithImpl<$Res, _$ButtonEntityImpl>
    implements _$$ButtonEntityImplCopyWith<$Res> {
  __$$ButtonEntityImplCopyWithImpl(
      _$ButtonEntityImpl _value, $Res Function(_$ButtonEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ButtonEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? count = null,
    Object? type = null,
  }) {
    return _then(_$ButtonEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ButtonType,
    ));
  }
}

/// @nodoc

class _$ButtonEntityImpl implements _ButtonEntity {
  const _$ButtonEntityImpl(
      {required this.id, required this.count, required this.type});

  @override
  final int id;
  @override
  final int count;
  @override
  final ButtonType type;

  @override
  String toString() {
    return 'ButtonEntity(id: $id, count: $count, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ButtonEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, count, type);

  /// Create a copy of ButtonEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ButtonEntityImplCopyWith<_$ButtonEntityImpl> get copyWith =>
      __$$ButtonEntityImplCopyWithImpl<_$ButtonEntityImpl>(this, _$identity);
}

abstract class _ButtonEntity implements ButtonEntity {
  const factory _ButtonEntity(
      {required final int id,
      required final int count,
      required final ButtonType type}) = _$ButtonEntityImpl;

  @override
  int get id;
  @override
  int get count;
  @override
  ButtonType get type;

  /// Create a copy of ButtonEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ButtonEntityImplCopyWith<_$ButtonEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
