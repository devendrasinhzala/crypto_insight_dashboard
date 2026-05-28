// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoinModel {

 String get id; String get name; String get image; String get symbol;@JsonKey(name: 'current_price') double? get currentPrice;@JsonKey(name: 'price_change_percentage_24h') double? get priceChange24hPercentage;@JsonKey(name: 'market_cap_rank') int? get marketCapRank;@JsonKey(name: 'last_updated') String? get lastUpdated;@JsonKey(name: 'price_change_24h') double? get priceChange24h;
/// Create a copy of CoinModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinModelCopyWith<CoinModel> get copyWith => _$CoinModelCopyWithImpl<CoinModel>(this as CoinModel, _$identity);

  /// Serializes this CoinModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.priceChange24hPercentage, priceChange24hPercentage) || other.priceChange24hPercentage == priceChange24hPercentage)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.priceChange24h, priceChange24h) || other.priceChange24h == priceChange24h));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,symbol,currentPrice,priceChange24hPercentage,marketCapRank,lastUpdated,priceChange24h);

@override
String toString() {
  return 'CoinModel(id: $id, name: $name, image: $image, symbol: $symbol, currentPrice: $currentPrice, priceChange24hPercentage: $priceChange24hPercentage, marketCapRank: $marketCapRank, lastUpdated: $lastUpdated, priceChange24h: $priceChange24h)';
}


}

/// @nodoc
abstract mixin class $CoinModelCopyWith<$Res>  {
  factory $CoinModelCopyWith(CoinModel value, $Res Function(CoinModel) _then) = _$CoinModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String image, String symbol,@JsonKey(name: 'current_price') double? currentPrice,@JsonKey(name: 'price_change_percentage_24h') double? priceChange24hPercentage,@JsonKey(name: 'market_cap_rank') int? marketCapRank,@JsonKey(name: 'last_updated') String? lastUpdated,@JsonKey(name: 'price_change_24h') double? priceChange24h
});




}
/// @nodoc
class _$CoinModelCopyWithImpl<$Res>
    implements $CoinModelCopyWith<$Res> {
  _$CoinModelCopyWithImpl(this._self, this._then);

  final CoinModel _self;
  final $Res Function(CoinModel) _then;

/// Create a copy of CoinModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? image = null,Object? symbol = null,Object? currentPrice = freezed,Object? priceChange24hPercentage = freezed,Object? marketCapRank = freezed,Object? lastUpdated = freezed,Object? priceChange24h = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double?,priceChange24hPercentage: freezed == priceChange24hPercentage ? _self.priceChange24hPercentage : priceChange24hPercentage // ignore: cast_nullable_to_non_nullable
as double?,marketCapRank: freezed == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,priceChange24h: freezed == priceChange24h ? _self.priceChange24h : priceChange24h // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoinModel].
extension CoinModelPatterns on CoinModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinModel value)  $default,){
final _that = this;
switch (_that) {
case _CoinModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinModel value)?  $default,){
final _that = this;
switch (_that) {
case _CoinModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String image,  String symbol, @JsonKey(name: 'current_price')  double? currentPrice, @JsonKey(name: 'price_change_percentage_24h')  double? priceChange24hPercentage, @JsonKey(name: 'market_cap_rank')  int? marketCapRank, @JsonKey(name: 'last_updated')  String? lastUpdated, @JsonKey(name: 'price_change_24h')  double? priceChange24h)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinModel() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.symbol,_that.currentPrice,_that.priceChange24hPercentage,_that.marketCapRank,_that.lastUpdated,_that.priceChange24h);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String image,  String symbol, @JsonKey(name: 'current_price')  double? currentPrice, @JsonKey(name: 'price_change_percentage_24h')  double? priceChange24hPercentage, @JsonKey(name: 'market_cap_rank')  int? marketCapRank, @JsonKey(name: 'last_updated')  String? lastUpdated, @JsonKey(name: 'price_change_24h')  double? priceChange24h)  $default,) {final _that = this;
switch (_that) {
case _CoinModel():
return $default(_that.id,_that.name,_that.image,_that.symbol,_that.currentPrice,_that.priceChange24hPercentage,_that.marketCapRank,_that.lastUpdated,_that.priceChange24h);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String image,  String symbol, @JsonKey(name: 'current_price')  double? currentPrice, @JsonKey(name: 'price_change_percentage_24h')  double? priceChange24hPercentage, @JsonKey(name: 'market_cap_rank')  int? marketCapRank, @JsonKey(name: 'last_updated')  String? lastUpdated, @JsonKey(name: 'price_change_24h')  double? priceChange24h)?  $default,) {final _that = this;
switch (_that) {
case _CoinModel() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.symbol,_that.currentPrice,_that.priceChange24hPercentage,_that.marketCapRank,_that.lastUpdated,_that.priceChange24h);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoinModel implements CoinModel {
  const _CoinModel({required this.id, required this.name, required this.image, required this.symbol, @JsonKey(name: 'current_price') this.currentPrice, @JsonKey(name: 'price_change_percentage_24h') this.priceChange24hPercentage, @JsonKey(name: 'market_cap_rank') this.marketCapRank, @JsonKey(name: 'last_updated') this.lastUpdated, @JsonKey(name: 'price_change_24h') this.priceChange24h});
  factory _CoinModel.fromJson(Map<String, dynamic> json) => _$CoinModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String image;
@override final  String symbol;
@override@JsonKey(name: 'current_price') final  double? currentPrice;
@override@JsonKey(name: 'price_change_percentage_24h') final  double? priceChange24hPercentage;
@override@JsonKey(name: 'market_cap_rank') final  int? marketCapRank;
@override@JsonKey(name: 'last_updated') final  String? lastUpdated;
@override@JsonKey(name: 'price_change_24h') final  double? priceChange24h;

/// Create a copy of CoinModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinModelCopyWith<_CoinModel> get copyWith => __$CoinModelCopyWithImpl<_CoinModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoinModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.priceChange24hPercentage, priceChange24hPercentage) || other.priceChange24hPercentage == priceChange24hPercentage)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.priceChange24h, priceChange24h) || other.priceChange24h == priceChange24h));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,symbol,currentPrice,priceChange24hPercentage,marketCapRank,lastUpdated,priceChange24h);

@override
String toString() {
  return 'CoinModel(id: $id, name: $name, image: $image, symbol: $symbol, currentPrice: $currentPrice, priceChange24hPercentage: $priceChange24hPercentage, marketCapRank: $marketCapRank, lastUpdated: $lastUpdated, priceChange24h: $priceChange24h)';
}


}

/// @nodoc
abstract mixin class _$CoinModelCopyWith<$Res> implements $CoinModelCopyWith<$Res> {
  factory _$CoinModelCopyWith(_CoinModel value, $Res Function(_CoinModel) _then) = __$CoinModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String image, String symbol,@JsonKey(name: 'current_price') double? currentPrice,@JsonKey(name: 'price_change_percentage_24h') double? priceChange24hPercentage,@JsonKey(name: 'market_cap_rank') int? marketCapRank,@JsonKey(name: 'last_updated') String? lastUpdated,@JsonKey(name: 'price_change_24h') double? priceChange24h
});




}
/// @nodoc
class __$CoinModelCopyWithImpl<$Res>
    implements _$CoinModelCopyWith<$Res> {
  __$CoinModelCopyWithImpl(this._self, this._then);

  final _CoinModel _self;
  final $Res Function(_CoinModel) _then;

/// Create a copy of CoinModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? image = null,Object? symbol = null,Object? currentPrice = freezed,Object? priceChange24hPercentage = freezed,Object? marketCapRank = freezed,Object? lastUpdated = freezed,Object? priceChange24h = freezed,}) {
  return _then(_CoinModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double?,priceChange24hPercentage: freezed == priceChange24hPercentage ? _self.priceChange24hPercentage : priceChange24hPercentage // ignore: cast_nullable_to_non_nullable
as double?,marketCapRank: freezed == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,priceChange24h: freezed == priceChange24h ? _self.priceChange24h : priceChange24h // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
