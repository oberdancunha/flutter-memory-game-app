// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CardStateTearOff {
  const _$CardStateTearOff();

  _CardState call(
      {required KtList<Card> cards,
      required int cardRevealed,
      bool? lockRevealCard}) {
    return _CardState(
      cards: cards,
      cardRevealed: cardRevealed,
      lockRevealCard: lockRevealCard,
    );
  }
}

/// @nodoc
const $CardState = _$CardStateTearOff();

/// @nodoc
mixin _$CardState {
  KtList<Card> get cards => throw _privateConstructorUsedError;
  int get cardRevealed => throw _privateConstructorUsedError;
  bool? get lockRevealCard => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardStateCopyWith<CardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardStateCopyWith<$Res> {
  factory $CardStateCopyWith(CardState value, $Res Function(CardState) then) =
      _$CardStateCopyWithImpl<$Res>;
  $Res call({KtList<Card> cards, int cardRevealed, bool? lockRevealCard});
}

/// @nodoc
class _$CardStateCopyWithImpl<$Res> implements $CardStateCopyWith<$Res> {
  _$CardStateCopyWithImpl(this._value, this._then);

  final CardState _value;
  // ignore: unused_field
  final $Res Function(CardState) _then;

  @override
  $Res call({
    Object? cards = freezed,
    Object? cardRevealed = freezed,
    Object? lockRevealCard = freezed,
  }) {
    return _then(_value.copyWith(
      cards: cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as KtList<Card>,
      cardRevealed: cardRevealed == freezed
          ? _value.cardRevealed
          : cardRevealed // ignore: cast_nullable_to_non_nullable
              as int,
      lockRevealCard: lockRevealCard == freezed
          ? _value.lockRevealCard
          : lockRevealCard // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$CardStateCopyWith<$Res> implements $CardStateCopyWith<$Res> {
  factory _$CardStateCopyWith(
          _CardState value, $Res Function(_CardState) then) =
      __$CardStateCopyWithImpl<$Res>;
  @override
  $Res call({KtList<Card> cards, int cardRevealed, bool? lockRevealCard});
}

/// @nodoc
class __$CardStateCopyWithImpl<$Res> extends _$CardStateCopyWithImpl<$Res>
    implements _$CardStateCopyWith<$Res> {
  __$CardStateCopyWithImpl(_CardState _value, $Res Function(_CardState) _then)
      : super(_value, (v) => _then(v as _CardState));

  @override
  _CardState get _value => super._value as _CardState;

  @override
  $Res call({
    Object? cards = freezed,
    Object? cardRevealed = freezed,
    Object? lockRevealCard = freezed,
  }) {
    return _then(_CardState(
      cards: cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as KtList<Card>,
      cardRevealed: cardRevealed == freezed
          ? _value.cardRevealed
          : cardRevealed // ignore: cast_nullable_to_non_nullable
              as int,
      lockRevealCard: lockRevealCard == freezed
          ? _value.lockRevealCard
          : lockRevealCard // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_CardState implements _CardState {
  const _$_CardState(
      {required this.cards, required this.cardRevealed, this.lockRevealCard});

  @override
  final KtList<Card> cards;
  @override
  final int cardRevealed;
  @override
  final bool? lockRevealCard;

  @override
  String toString() {
    return 'CardState(cards: $cards, cardRevealed: $cardRevealed, lockRevealCard: $lockRevealCard)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CardState &&
            (identical(other.cards, cards) ||
                const DeepCollectionEquality().equals(other.cards, cards)) &&
            (identical(other.cardRevealed, cardRevealed) ||
                const DeepCollectionEquality()
                    .equals(other.cardRevealed, cardRevealed)) &&
            (identical(other.lockRevealCard, lockRevealCard) ||
                const DeepCollectionEquality()
                    .equals(other.lockRevealCard, lockRevealCard)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cards) ^
      const DeepCollectionEquality().hash(cardRevealed) ^
      const DeepCollectionEquality().hash(lockRevealCard);

  @JsonKey(ignore: true)
  @override
  _$CardStateCopyWith<_CardState> get copyWith =>
      __$CardStateCopyWithImpl<_CardState>(this, _$identity);
}

abstract class _CardState implements CardState {
  const factory _CardState(
      {required KtList<Card> cards,
      required int cardRevealed,
      bool? lockRevealCard}) = _$_CardState;

  @override
  KtList<Card> get cards => throw _privateConstructorUsedError;
  @override
  int get cardRevealed => throw _privateConstructorUsedError;
  @override
  bool? get lockRevealCard => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CardStateCopyWith<_CardState> get copyWith =>
      throw _privateConstructorUsedError;
}
