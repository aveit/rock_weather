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
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _Loading loading() {
    return const _Loading();
  }

// ignore: unused_element
  _Error error() {
    return const _Error();
  }

// ignore: unused_element
  _Loaded loaded(Weather weatherResult) {
    return _Loaded(
      weatherResult,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CurrentWeatherState = _$CurrentWeatherStateTearOff();

/// @nodoc
mixin _$CurrentWeatherState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult error(),
    @required TResult loaded(Weather weatherResult),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult error(),
    TResult loaded(Weather weatherResult),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult error(_Error value),
    @required TResult loaded(_Loaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult error(_Error value),
    TResult loaded(_Loaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $CurrentWeatherStateCopyWith<$Res> {
  factory $CurrentWeatherStateCopyWith(
          CurrentWeatherState value, $Res Function(CurrentWeatherState) then) =
      _$CurrentWeatherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CurrentWeatherStateCopyWithImpl<$Res>
    implements $CurrentWeatherStateCopyWith<$Res> {
  _$CurrentWeatherStateCopyWithImpl(this._value, this._then);

  final CurrentWeatherState _value;
  // ignore: unused_field
  final $Res Function(CurrentWeatherState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$CurrentWeatherStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'CurrentWeatherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult error(),
    @required TResult loaded(Weather weatherResult),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult error(),
    TResult loaded(Weather weatherResult),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult error(_Error value),
    @required TResult loaded(_Loaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult error(_Error value),
    TResult loaded(_Loaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CurrentWeatherState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$CurrentWeatherStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc
class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'CurrentWeatherState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult error(),
    @required TResult loaded(Weather weatherResult),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult error(),
    TResult loaded(Weather weatherResult),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult error(_Error value),
    @required TResult loaded(_Loaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult error(_Error value),
    TResult loaded(_Loaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CurrentWeatherState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$CurrentWeatherStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;
}

/// @nodoc
class _$_Error implements _Error {
  const _$_Error();

  @override
  String toString() {
    return 'CurrentWeatherState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult error(),
    @required TResult loaded(Weather weatherResult),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult error(),
    TResult loaded(Weather weatherResult),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult error(_Error value),
    @required TResult loaded(_Loaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult error(_Error value),
    TResult loaded(_Loaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CurrentWeatherState {
  const factory _Error() = _$_Error;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  $Res call({Weather weatherResult});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    extends _$CurrentWeatherStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object weatherResult = freezed,
  }) {
    return _then(_Loaded(
      weatherResult == freezed
          ? _value.weatherResult
          : weatherResult as Weather,
    ));
  }
}

/// @nodoc
class _$_Loaded implements _Loaded {
  const _$_Loaded(this.weatherResult) : assert(weatherResult != null);

  @override
  final Weather weatherResult;

  @override
  String toString() {
    return 'CurrentWeatherState.loaded(weatherResult: $weatherResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loaded &&
            (identical(other.weatherResult, weatherResult) ||
                const DeepCollectionEquality()
                    .equals(other.weatherResult, weatherResult)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(weatherResult);

  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult error(),
    @required TResult loaded(Weather weatherResult),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loaded(weatherResult);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult error(),
    TResult loaded(Weather weatherResult),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(weatherResult);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult error(_Error value),
    @required TResult loaded(_Loaded value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult error(_Error value),
    TResult loaded(_Loaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements CurrentWeatherState {
  const factory _Loaded(Weather weatherResult) = _$_Loaded;

  Weather get weatherResult;
  _$LoadedCopyWith<_Loaded> get copyWith;
}
