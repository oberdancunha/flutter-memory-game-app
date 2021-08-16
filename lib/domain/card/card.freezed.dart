// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CardTearOff {
  const _$CardTearOff();

  _Card call(
      {required int id,
      required String name,
      required String image,
      required bool isMatched}) {
    return _Card(
      id: id,
      name: name,
      image: image,
      isMatched: isMatched,
    );
  }
}

/// @nodoc
const $Card = _$CardTearOff();

/// @nodoc
mixin _$Card {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  bool get isMatched => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardCopyWith<Card> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardCopyWith<$Res> {
  factory $CardCopyWith(Card value, $Res Function(Card) then) =
      _$CardCopyWithImpl<$Res>;
  $Res call({int id, String name, String image, bool isMatched});
}

/// @nodoc
class _$CardCopyWithImpl<$Res> implements $CardCopyWith<$Res> {
  _$CardCopyWithImpl(this._value, this._then);

  final Card _value;
  // ignore: unused_field
  final $Res Function(Card) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? isMatched = freezed,
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
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isMatched: isMatched == freezed
          ? _value.isMatched
          : isMatched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$CardCopyWith<$Res> implements $CardCopyWith<$Res> {
  factory _$CardCopyWith(_Card value, $Res Function(_Card) then) =
      __$CardCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String image, bool isMatched});
}

/// @nodoc
class __$CardCopyWithImpl<$Res> extends _$CardCopyWithImpl<$Res>
    implements _$CardCopyWith<$Res> {
  __$CardCopyWithImpl(_Card _value, $Res Function(_Card) _then)
      : super(_value, (v) => _then(v as _Card));

  @override
  _Card get _value => super._value as _Card;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? isMatched = freezed,
  }) {
    return _then(_Card(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isMatched: isMatched == freezed
          ? _value.isMatched
          : isMatched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Card extends _Card {
  const _$_Card(
      {required this.id,
      required this.name,
      required this.image,
      required this.isMatched})
      : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final String image;
  @override
  final bool isMatched;

  @override
  String toString() {
    return 'Card(id: $id, name: $name, image: $image, isMatched: $isMatched)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Card &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.isMatched, isMatched) ||
                const DeepCollectionEquality()
                    .equals(other.isMatched, isMatched)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(isMatched);

  @JsonKey(ignore: true)
  @override
  _$CardCopyWith<_Card> get copyWith =>
      __$CardCopyWithImpl<_Card>(this, _$identity);
}

abstract class _Card extends Card {
  const factory _Card(
      {required int id,
      required String name,
      required String image,
      required bool isMatched}) = _$_Card;
  const _Card._() : super._();

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get image => throw _privateConstructorUsedError;
  @override
  bool get isMatched => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CardCopyWith<_Card> get copyWith => throw _privateConstructorUsedError;
}
