// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'current_weather_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CurrentWeatherEventTearOff {
  const _$CurrentWeatherEventTearOff();

// ignore: unused_element
  _GetCurrentWeatherForCity getCurrentWeatherForCity({@required City city}) {
    return _GetCurrentWeatherForCity(
      city: city,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CurrentWeatherEvent = _$CurrentWeatherEventTearOff();

/// @nodoc
mixin _$CurrentWeatherEvent {
  City get city;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getCurrentWeatherForCity(City city),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getCurrentWeatherForCity(City city),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getCurrentWeatherForCity(_GetCurrentWeatherForCity value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getCurrentWeatherForCity(_GetCurrentWeatherForCity value),
    @required TResult orElse(),
  });

  $CurrentWeatherEventCopyWith<CurrentWeatherEvent> get copyWith;
}

/// @nodoc
abstract class $CurrentWeatherEventCopyWith<$Res> {
  factory $CurrentWeatherEventCopyWith(
          CurrentWeatherEvent value, $Res Function(CurrentWeatherEvent) then) =
      _$CurrentWeatherEventCopyWithImpl<$Res>;
  $Res call({City city});
}

/// @nodoc
class _$CurrentWeatherEventCopyWithImpl<$Res>
    implements $CurrentWeatherEventCopyWith<$Res> {
  _$CurrentWeatherEventCopyWithImpl(this._value, this._then);

  final CurrentWeatherEvent _value;
  // ignore: unused_field
  final $Res Function(CurrentWeatherEvent) _then;

  @override
  $Res call({
    Object city = freezed,
  }) {
    return _then(_value.copyWith(
      city: city == freezed ? _value.city : city as City,
    ));
  }
}

/// @nodoc
abstract class _$GetCurrentWeatherForCityCopyWith<$Res>
    implements $CurrentWeatherEventCopyWith<$Res> {
  factory _$GetCurrentWeatherForCityCopyWith(_GetCurrentWeatherForCity value,
          $Res Function(_GetCurrentWeatherForCity) then) =
      __$GetCurrentWeatherForCityCopyWithImpl<$Res>;
  @override
  $Res call({City city});
}

/// @nodoc
class __$GetCurrentWeatherForCityCopyWithImpl<$Res>
    extends _$CurrentWeatherEventCopyWithImpl<$Res>
    implements _$GetCurrentWeatherForCityCopyWith<$Res> {
  __$GetCurrentWeatherForCityCopyWithImpl(_GetCurrentWeatherForCity _value,
      $Res Function(_GetCurrentWeatherForCity) _then)
      : super(_value, (v) => _then(v as _GetCurrentWeatherForCity));

  @override
  _GetCurrentWeatherForCity get _value =>
      super._value as _GetCurrentWeatherForCity;

  @override
  $Res call({
    Object city = freezed,
  }) {
    return _then(_GetCurrentWeatherForCity(
      city: city == freezed ? _value.city : city as City,
    ));
  }
}

/// @nodoc
class _$_GetCurrentWeatherForCity implements _GetCurrentWeatherForCity {
  const _$_GetCurrentWeatherForCity({@required this.city})
      : assert(city != null);

  @override
  final City city;

  @override
  String toString() {
    return 'CurrentWeatherEvent.getCurrentWeatherForCity(city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetCurrentWeatherForCity &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(city);

  @override
  _$GetCurrentWeatherForCityCopyWith<_GetCurrentWeatherForCity> get copyWith =>
      __$GetCurrentWeatherForCityCopyWithImpl<_GetCurrentWeatherForCity>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getCurrentWeatherForCity(City city),
  }) {
    assert(getCurrentWeatherForCity != null);
    return getCurrentWeatherForCity(city);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getCurrentWeatherForCity(City city),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (getCurrentWeatherForCity != null) {
      return getCurrentWeatherForCity(city);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getCurrentWeatherForCity(_GetCurrentWeatherForCity value),
  }) {
    assert(getCurrentWeatherForCity != null);
    return getCurrentWeatherForCity(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getCurrentWeatherForCity(_GetCurrentWeatherForCity value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (getCurrentWeatherForCity != null) {
      return getCurrentWeatherForCity(this);
    }
    return orElse();
  }
}

abstract class _GetCurrentWeatherForCity implements CurrentWeatherEvent {
  const factory _GetCurrentWeatherForCity({@required City city}) =
      _$_GetCurrentWeatherForCity;

  @override
  City get city;
  @override
  _$GetCurrentWeatherForCityCopyWith<_GetCurrentWeatherForCity> get copyWith;
}

/// @nodoc
class _$CurrentWeatherStateTearOff {
  const _$CurrentWeatherStateTearOff();

// ignore: unused_element
  _CurrentWeatherState call({bool isLoading, String error, City loadedCity}) {
    return _CurrentWeatherState(
      isLoading: isLoading,
      error: error,
      loadedCity: loadedCity,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CurrentWeatherState = _$CurrentWeatherStateTearOff();

/// @nodoc
mixin _$CurrentWeatherState {
  bool get isLoading;
  String get error;
  City get loadedCity;

  $CurrentWeatherStateCopyWith<CurrentWeatherState> get copyWith;
}

/// @nodoc
abstract class $CurrentWeatherStateCopyWith<$Res> {
  factory $CurrentWeatherStateCopyWith(
          CurrentWeatherState value, $Res Function(CurrentWeatherState) then) =
      _$CurrentWeatherStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, String error, City loadedCity});
}

/// @nodoc
class _$CurrentWeatherStateCopyWithImpl<$Res>
    implements $CurrentWeatherStateCopyWith<$Res> {
  _$CurrentWeatherStateCopyWithImpl(this._value, this._then);

  final CurrentWeatherState _value;
  // ignore: unused_field
  final $Res Function(CurrentWeatherState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object error = freezed,
    Object loadedCity = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      error: error == freezed ? _value.error : error as String,
      loadedCity:
          loadedCity == freezed ? _value.loadedCity : loadedCity as City,
    ));
  }
}

/// @nodoc
abstract class _$CurrentWeatherStateCopyWith<$Res>
    implements $CurrentWeatherStateCopyWith<$Res> {
  factory _$CurrentWeatherStateCopyWith(_CurrentWeatherState value,
          $Res Function(_CurrentWeatherState) then) =
      __$CurrentWeatherStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, String error, City loadedCity});
}

/// @nodoc
class __$CurrentWeatherStateCopyWithImpl<$Res>
    extends _$CurrentWeatherStateCopyWithImpl<$Res>
    implements _$CurrentWeatherStateCopyWith<$Res> {
  __$CurrentWeatherStateCopyWithImpl(
      _CurrentWeatherState _value, $Res Function(_CurrentWeatherState) _then)
      : super(_value, (v) => _then(v as _CurrentWeatherState));

  @override
  _CurrentWeatherState get _value => super._value as _CurrentWeatherState;

  @override
  $Res call({
    Object isLoading = freezed,
    Object error = freezed,
    Object loadedCity = freezed,
  }) {
    return _then(_CurrentWeatherState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      error: error == freezed ? _value.error : error as String,
      loadedCity:
          loadedCity == freezed ? _value.loadedCity : loadedCity as City,
    ));
  }
}

/// @nodoc
class _$_CurrentWeatherState implements _CurrentWeatherState {
  const _$_CurrentWeatherState({this.isLoading, this.error, this.loadedCity});

  @override
  final bool isLoading;
  @override
  final String error;
  @override
  final City loadedCity;

  @override
  String toString() {
    return 'CurrentWeatherState(isLoading: $isLoading, error: $error, loadedCity: $loadedCity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CurrentWeatherState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.loadedCity, loadedCity) ||
                const DeepCollectionEquality()
                    .equals(other.loadedCity, loadedCity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(loadedCity);

  @override
  _$CurrentWeatherStateCopyWith<_CurrentWeatherState> get copyWith =>
      __$CurrentWeatherStateCopyWithImpl<_CurrentWeatherState>(
          this, _$identity);
}

abstract class _CurrentWeatherState implements CurrentWeatherState {
  const factory _CurrentWeatherState(
      {bool isLoading, String error, City loadedCity}) = _$_CurrentWeatherState;

  @override
  bool get isLoading;
  @override
  String get error;
  @override
  City get loadedCity;
  @override
  _$CurrentWeatherStateCopyWith<_CurrentWeatherState> get copyWith;
}
