// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'card_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CardDtoTearOff {
  const _$CardDtoTearOff();

  _CardDto call(
      {required String name,
      required String image,
      required int selectedToGame}) {
    return _CardDto(
      name: name,
      image: image,
      selectedToGame: selectedToGame,
    );
  }
}

/// @nodoc
const $CardDto = _$CardDtoTearOff();

/// @nodoc
mixin _$CardDto {
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get selectedToGame => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardDtoCopyWith<CardDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardDtoCopyWith<$Res> {
  factory $CardDtoCopyWith(CardDto value, $Res Function(CardDto) then) =
      _$CardDtoCopyWithImpl<$Res>;
  $Res call({String name, String image, int selectedToGame});
}

/// @nodoc
class _$CardDtoCopyWithImpl<$Res> implements $CardDtoCopyWith<$Res> {
  _$CardDtoCopyWithImpl(this._value, this._then);

  final CardDto _value;
  // ignore: unused_field
  final $Res Function(CardDto) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? image = freezed,
    Object? selectedToGame = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      selectedToGame: selectedToGame == freezed
          ? _value.selectedToGame
          : selectedToGame // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CardDtoCopyWith<$Res> implements $CardDtoCopyWith<$Res> {
  factory _$CardDtoCopyWith(_CardDto value, $Res Function(_CardDto) then) =
      __$CardDtoCopyWithImpl<$Res>;
  @override
  $Res call({String name, String image, int selectedToGame});
}

/// @nodoc
class __$CardDtoCopyWithImpl<$Res> extends _$CardDtoCopyWithImpl<$Res>
    implements _$CardDtoCopyWith<$Res> {
  __$CardDtoCopyWithImpl(_CardDto _value, $Res Function(_CardDto) _then)
      : super(_value, (v) => _then(v as _CardDto));

  @override
  _CardDto get _value => super._value as _CardDto;

  @override
  $Res call({
    Object? name = freezed,
    Object? image = freezed,
    Object? selectedToGame = freezed,
  }) {
    return _then(_CardDto(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      selectedToGame: selectedToGame == freezed
          ? _value.selectedToGame
          : selectedToGame // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CardDto extends _CardDto {
  _$_CardDto(
      {required this.name, required this.image, required this.selectedToGame})
      : super._();

  @override
  final String name;
  @override
  final String image;
  @override
  final int selectedToGame;

  @override
  String toString() {
    return 'CardDto(name: $name, image: $image, selectedToGame: $selectedToGame)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CardDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.selectedToGame, selectedToGame) ||
                const DeepCollectionEquality()
                    .equals(other.selectedToGame, selectedToGame)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(selectedToGame);

  @JsonKey(ignore: true)
  @override
  _$CardDtoCopyWith<_CardDto> get copyWith =>
      __$CardDtoCopyWithImpl<_CardDto>(this, _$identity);
}

abstract class _CardDto extends CardDto {
  factory _CardDto(
      {required String name,
      required String image,
      required int selectedToGame}) = _$_CardDto;
  _CardDto._() : super._();

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get image => throw _privateConstructorUsedError;
  @override
  int get selectedToGame => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CardDtoCopyWith<_CardDto> get copyWith =>
      throw _privateConstructorUsedError;
}
