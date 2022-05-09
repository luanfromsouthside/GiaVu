// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'branch.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return _Branch.fromJson(json);
}

/// @nodoc
mixin _$Branch {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get mail => throw _privateConstructorUsedError;
  String get manager => throw _privateConstructorUsedError;
  String get isPublish => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchCopyWith<Branch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchCopyWith<$Res> {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) then) =
      _$BranchCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String address,
      String phone,
      String mail,
      String manager,
      String isPublish,
      String description});
}

/// @nodoc
class _$BranchCopyWithImpl<$Res> implements $BranchCopyWith<$Res> {
  _$BranchCopyWithImpl(this._value, this._then);

  final Branch _value;
  // ignore: unused_field
  final $Res Function(Branch) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? mail = freezed,
    Object? manager = freezed,
    Object? isPublish = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      mail: mail == freezed
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
      manager: manager == freezed
          ? _value.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as String,
      isPublish: isPublish == freezed
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_BranchCopyWith<$Res> implements $BranchCopyWith<$Res> {
  factory _$$_BranchCopyWith(_$_Branch value, $Res Function(_$_Branch) then) =
      __$$_BranchCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String address,
      String phone,
      String mail,
      String manager,
      String isPublish,
      String description});
}

/// @nodoc
class __$$_BranchCopyWithImpl<$Res> extends _$BranchCopyWithImpl<$Res>
    implements _$$_BranchCopyWith<$Res> {
  __$$_BranchCopyWithImpl(_$_Branch _value, $Res Function(_$_Branch) _then)
      : super(_value, (v) => _then(v as _$_Branch));

  @override
  _$_Branch get _value => super._value as _$_Branch;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? mail = freezed,
    Object? manager = freezed,
    Object? isPublish = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_Branch(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      mail: mail == freezed
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
      manager: manager == freezed
          ? _value.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as String,
      isPublish: isPublish == freezed
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Branch with DiagnosticableTreeMixin implements _Branch {
  const _$_Branch(
      {required this.id,
      required this.name,
      required this.address,
      required this.phone,
      required this.mail,
      required this.manager,
      required this.isPublish,
      required this.description});

  factory _$_Branch.fromJson(Map<String, dynamic> json) =>
      _$$_BranchFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String address;
  @override
  final String phone;
  @override
  final String mail;
  @override
  final String manager;
  @override
  final String isPublish;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Branch(id: $id, name: $name, address: $address, phone: $phone, mail: $mail, manager: $manager, isPublish: $isPublish, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Branch'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('mail', mail))
      ..add(DiagnosticsProperty('manager', manager))
      ..add(DiagnosticsProperty('isPublish', isPublish))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Branch &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.mail, mail) &&
            const DeepCollectionEquality().equals(other.manager, manager) &&
            const DeepCollectionEquality().equals(other.isPublish, isPublish) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(mail),
      const DeepCollectionEquality().hash(manager),
      const DeepCollectionEquality().hash(isPublish),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_BranchCopyWith<_$_Branch> get copyWith =>
      __$$_BranchCopyWithImpl<_$_Branch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BranchToJson(this);
  }
}

abstract class _Branch implements Branch {
  const factory _Branch(
      {required final int id,
      required final String name,
      required final String address,
      required final String phone,
      required final String mail,
      required final String manager,
      required final String isPublish,
      required final String description}) = _$_Branch;

  factory _Branch.fromJson(Map<String, dynamic> json) = _$_Branch.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  String get phone => throw _privateConstructorUsedError;
  @override
  String get mail => throw _privateConstructorUsedError;
  @override
  String get manager => throw _privateConstructorUsedError;
  @override
  String get isPublish => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BranchCopyWith<_$_Branch> get copyWith =>
      throw _privateConstructorUsedError;
}
