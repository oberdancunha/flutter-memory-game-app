// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FailureTearOff {
  const _$FailureTearOff();

  _CardsNotMatched cardsNotMatched(KtList<Card> cards) {
    return _CardsNotMatched(
      cards,
    );
  }
}

/// @nodoc
const $Failure = _$FailureTearOff();

/// @nodoc
mixin _$Failure {
  KtList<Card> get cards => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<Card> cards) cardsNotMatched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<Card> cards)? cardsNotMatched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardsNotMatched value) cardsNotMatched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardsNotMatched value)? cardsNotMatched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
  $Res call({KtList<Card> cards});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure _value;
  // ignore: unused_field
  final $Res Function(Failure) _then;

  @override
  $Res call({
    Object? cards = freezed,
  }) {
    return _then(_value.copyWith(
      cards: cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as KtList<Card>,
    ));
  }
}

/// @nodoc
abstract class _$CardsNotMatchedCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$CardsNotMatchedCopyWith(
          _CardsNotMatched value, $Res Function(_CardsNotMatched) then) =
      __$CardsNotMatchedCopyWithImpl<$Res>;
  @override
  $Res call({KtList<Card> cards});
}

/// @nodoc
class __$CardsNotMatchedCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$CardsNotMatchedCopyWith<$Res> {
  __$CardsNotMatchedCopyWithImpl(
      _CardsNotMatched _value, $Res Function(_CardsNotMatched) _then)
      : super(_value, (v) => _then(v as _CardsNotMatched));

  @override
  _CardsNotMatched get _value => super._value as _CardsNotMatched;

  @override
  $Res call({
    Object? cards = freezed,
  }) {
    return _then(_CardsNotMatched(
      cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as KtList<Card>,
    ));
  }
}

/// @nodoc

class _$_CardsNotMatched implements _CardsNotMatched {
  const _$_CardsNotMatched(this.cards);

  @override
  final KtList<Card> cards;

  @override
  String toString() {
    return 'Failure.cardsNotMatched(cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CardsNotMatched &&
            (identical(other.cards, cards) ||
                const DeepCollectionEquality().equals(other.cards, cards)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cards);

  @JsonKey(ignore: true)
  @override
  _$CardsNotMatchedCopyWith<_CardsNotMatched> get copyWith =>
      __$CardsNotMatchedCopyWithImpl<_CardsNotMatched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<Card> cards) cardsNotMatched,
  }) {
    return cardsNotMatched(cards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<Card> cards)? cardsNotMatched,
    required TResult orElse(),
  }) {
    if (cardsNotMatched != null) {
      return cardsNotMatched(cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardsNotMatched value) cardsNotMatched,
  }) {
    return cardsNotMatched(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardsNotMatched value)? cardsNotMatched,
    required TResult orElse(),
  }) {
    if (cardsNotMatched != null) {
      return cardsNotMatched(this);
    }
    return orElse();
  }
}

abstract class _CardsNotMatched implements Failure {
  const factory _CardsNotMatched(KtList<Card> cards) = _$_CardsNotMatched;

  @override
  KtList<Card> get cards => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CardsNotMatchedCopyWith<_CardsNotMatched> get copyWith =>
      throw _privateConstructorUsedError;
}
