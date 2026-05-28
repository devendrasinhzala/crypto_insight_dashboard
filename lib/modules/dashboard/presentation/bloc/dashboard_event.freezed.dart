// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardEvent()';
}


}

/// @nodoc
class $DashboardEventCopyWith<$Res>  {
$DashboardEventCopyWith(DashboardEvent _, $Res Function(DashboardEvent) __);
}


/// Adds pattern-matching-related methods to [DashboardEvent].
extension DashboardEventPatterns on DashboardEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchCoin value)?  fetchCoin,TResult Function( _RefreshCoin value)?  refreshCoin,TResult Function( _SearchCoin value)?  searchCoin,TResult Function( _CoinViewed value)?  coinViewed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchCoin() when fetchCoin != null:
return fetchCoin(_that);case _RefreshCoin() when refreshCoin != null:
return refreshCoin(_that);case _SearchCoin() when searchCoin != null:
return searchCoin(_that);case _CoinViewed() when coinViewed != null:
return coinViewed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchCoin value)  fetchCoin,required TResult Function( _RefreshCoin value)  refreshCoin,required TResult Function( _SearchCoin value)  searchCoin,required TResult Function( _CoinViewed value)  coinViewed,}){
final _that = this;
switch (_that) {
case _FetchCoin():
return fetchCoin(_that);case _RefreshCoin():
return refreshCoin(_that);case _SearchCoin():
return searchCoin(_that);case _CoinViewed():
return coinViewed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchCoin value)?  fetchCoin,TResult? Function( _RefreshCoin value)?  refreshCoin,TResult? Function( _SearchCoin value)?  searchCoin,TResult? Function( _CoinViewed value)?  coinViewed,}){
final _that = this;
switch (_that) {
case _FetchCoin() when fetchCoin != null:
return fetchCoin(_that);case _RefreshCoin() when refreshCoin != null:
return refreshCoin(_that);case _SearchCoin() when searchCoin != null:
return searchCoin(_that);case _CoinViewed() when coinViewed != null:
return coinViewed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchCoin,TResult Function()?  refreshCoin,TResult Function( String query)?  searchCoin,TResult Function( CoinEntity coin)?  coinViewed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchCoin() when fetchCoin != null:
return fetchCoin();case _RefreshCoin() when refreshCoin != null:
return refreshCoin();case _SearchCoin() when searchCoin != null:
return searchCoin(_that.query);case _CoinViewed() when coinViewed != null:
return coinViewed(_that.coin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchCoin,required TResult Function()  refreshCoin,required TResult Function( String query)  searchCoin,required TResult Function( CoinEntity coin)  coinViewed,}) {final _that = this;
switch (_that) {
case _FetchCoin():
return fetchCoin();case _RefreshCoin():
return refreshCoin();case _SearchCoin():
return searchCoin(_that.query);case _CoinViewed():
return coinViewed(_that.coin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchCoin,TResult? Function()?  refreshCoin,TResult? Function( String query)?  searchCoin,TResult? Function( CoinEntity coin)?  coinViewed,}) {final _that = this;
switch (_that) {
case _FetchCoin() when fetchCoin != null:
return fetchCoin();case _RefreshCoin() when refreshCoin != null:
return refreshCoin();case _SearchCoin() when searchCoin != null:
return searchCoin(_that.query);case _CoinViewed() when coinViewed != null:
return coinViewed(_that.coin);case _:
  return null;

}
}

}

/// @nodoc


class _FetchCoin implements DashboardEvent {
  const _FetchCoin();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchCoin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardEvent.fetchCoin()';
}


}




/// @nodoc


class _RefreshCoin implements DashboardEvent {
  const _RefreshCoin();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshCoin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardEvent.refreshCoin()';
}


}




/// @nodoc


class _SearchCoin implements DashboardEvent {
  const _SearchCoin({required this.query});
  

 final  String query;

/// Create a copy of DashboardEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCoinCopyWith<_SearchCoin> get copyWith => __$SearchCoinCopyWithImpl<_SearchCoin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchCoin&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'DashboardEvent.searchCoin(query: $query)';
}


}

/// @nodoc
abstract mixin class _$SearchCoinCopyWith<$Res> implements $DashboardEventCopyWith<$Res> {
  factory _$SearchCoinCopyWith(_SearchCoin value, $Res Function(_SearchCoin) _then) = __$SearchCoinCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$SearchCoinCopyWithImpl<$Res>
    implements _$SearchCoinCopyWith<$Res> {
  __$SearchCoinCopyWithImpl(this._self, this._then);

  final _SearchCoin _self;
  final $Res Function(_SearchCoin) _then;

/// Create a copy of DashboardEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_SearchCoin(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CoinViewed implements DashboardEvent {
  const _CoinViewed({required this.coin});
  

 final  CoinEntity coin;

/// Create a copy of DashboardEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinViewedCopyWith<_CoinViewed> get copyWith => __$CoinViewedCopyWithImpl<_CoinViewed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinViewed&&(identical(other.coin, coin) || other.coin == coin));
}


@override
int get hashCode => Object.hash(runtimeType,coin);

@override
String toString() {
  return 'DashboardEvent.coinViewed(coin: $coin)';
}


}

/// @nodoc
abstract mixin class _$CoinViewedCopyWith<$Res> implements $DashboardEventCopyWith<$Res> {
  factory _$CoinViewedCopyWith(_CoinViewed value, $Res Function(_CoinViewed) _then) = __$CoinViewedCopyWithImpl;
@useResult
$Res call({
 CoinEntity coin
});




}
/// @nodoc
class __$CoinViewedCopyWithImpl<$Res>
    implements _$CoinViewedCopyWith<$Res> {
  __$CoinViewedCopyWithImpl(this._self, this._then);

  final _CoinViewed _self;
  final $Res Function(_CoinViewed) _then;

/// Create a copy of DashboardEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? coin = null,}) {
  return _then(_CoinViewed(
coin: null == coin ? _self.coin : coin // ignore: cast_nullable_to_non_nullable
as CoinEntity,
  ));
}


}

// dart format on
