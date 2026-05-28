// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoinDetailsModel {

 String? get id; String? get name; String? get symbol; String? get image; String? get description; List<String>? get categories; double? get currentPrice; int? get marketCapRank; double? get marketCap; double? get totalVolume; double? get high24h; double? get low24h; double? get ath; double? get atl; double? get circulatingSupply; double? get maxSupply; double? get priceChangePercentage7d; double? get priceChangePercentage30d; List<double>? get sparklineInUsd; String? get websiteUrl; String? get whitepaperUrl;
/// Create a copy of CoinDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinDetailsModelCopyWith<CoinDetailsModel> get copyWith => _$CoinDetailsModelCopyWithImpl<CoinDetailsModel>(this as CoinDetailsModel, _$identity);

  /// Serializes this CoinDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinDetailsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.image, image) || other.image == image)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.totalVolume, totalVolume) || other.totalVolume == totalVolume)&&(identical(other.high24h, high24h) || other.high24h == high24h)&&(identical(other.low24h, low24h) || other.low24h == low24h)&&(identical(other.ath, ath) || other.ath == ath)&&(identical(other.atl, atl) || other.atl == atl)&&(identical(other.circulatingSupply, circulatingSupply) || other.circulatingSupply == circulatingSupply)&&(identical(other.maxSupply, maxSupply) || other.maxSupply == maxSupply)&&(identical(other.priceChangePercentage7d, priceChangePercentage7d) || other.priceChangePercentage7d == priceChangePercentage7d)&&(identical(other.priceChangePercentage30d, priceChangePercentage30d) || other.priceChangePercentage30d == priceChangePercentage30d)&&const DeepCollectionEquality().equals(other.sparklineInUsd, sparklineInUsd)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.whitepaperUrl, whitepaperUrl) || other.whitepaperUrl == whitepaperUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,symbol,image,description,const DeepCollectionEquality().hash(categories),currentPrice,marketCapRank,marketCap,totalVolume,high24h,low24h,ath,atl,circulatingSupply,maxSupply,priceChangePercentage7d,priceChangePercentage30d,const DeepCollectionEquality().hash(sparklineInUsd),websiteUrl,whitepaperUrl]);

@override
String toString() {
  return 'CoinDetailsModel(id: $id, name: $name, symbol: $symbol, image: $image, description: $description, categories: $categories, currentPrice: $currentPrice, marketCapRank: $marketCapRank, marketCap: $marketCap, totalVolume: $totalVolume, high24h: $high24h, low24h: $low24h, ath: $ath, atl: $atl, circulatingSupply: $circulatingSupply, maxSupply: $maxSupply, priceChangePercentage7d: $priceChangePercentage7d, priceChangePercentage30d: $priceChangePercentage30d, sparklineInUsd: $sparklineInUsd, websiteUrl: $websiteUrl, whitepaperUrl: $whitepaperUrl)';
}


}

/// @nodoc
abstract mixin class $CoinDetailsModelCopyWith<$Res>  {
  factory $CoinDetailsModelCopyWith(CoinDetailsModel value, $Res Function(CoinDetailsModel) _then) = _$CoinDetailsModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? symbol, String? image, String? description, List<String>? categories, double? currentPrice, int? marketCapRank, double? marketCap, double? totalVolume, double? high24h, double? low24h, double? ath, double? atl, double? circulatingSupply, double? maxSupply, double? priceChangePercentage7d, double? priceChangePercentage30d, List<double>? sparklineInUsd, String? websiteUrl, String? whitepaperUrl
});




}
/// @nodoc
class _$CoinDetailsModelCopyWithImpl<$Res>
    implements $CoinDetailsModelCopyWith<$Res> {
  _$CoinDetailsModelCopyWithImpl(this._self, this._then);

  final CoinDetailsModel _self;
  final $Res Function(CoinDetailsModel) _then;

/// Create a copy of CoinDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? symbol = freezed,Object? image = freezed,Object? description = freezed,Object? categories = freezed,Object? currentPrice = freezed,Object? marketCapRank = freezed,Object? marketCap = freezed,Object? totalVolume = freezed,Object? high24h = freezed,Object? low24h = freezed,Object? ath = freezed,Object? atl = freezed,Object? circulatingSupply = freezed,Object? maxSupply = freezed,Object? priceChangePercentage7d = freezed,Object? priceChangePercentage30d = freezed,Object? sparklineInUsd = freezed,Object? websiteUrl = freezed,Object? whitepaperUrl = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double?,marketCapRank: freezed == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int?,marketCap: freezed == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double?,totalVolume: freezed == totalVolume ? _self.totalVolume : totalVolume // ignore: cast_nullable_to_non_nullable
as double?,high24h: freezed == high24h ? _self.high24h : high24h // ignore: cast_nullable_to_non_nullable
as double?,low24h: freezed == low24h ? _self.low24h : low24h // ignore: cast_nullable_to_non_nullable
as double?,ath: freezed == ath ? _self.ath : ath // ignore: cast_nullable_to_non_nullable
as double?,atl: freezed == atl ? _self.atl : atl // ignore: cast_nullable_to_non_nullable
as double?,circulatingSupply: freezed == circulatingSupply ? _self.circulatingSupply : circulatingSupply // ignore: cast_nullable_to_non_nullable
as double?,maxSupply: freezed == maxSupply ? _self.maxSupply : maxSupply // ignore: cast_nullable_to_non_nullable
as double?,priceChangePercentage7d: freezed == priceChangePercentage7d ? _self.priceChangePercentage7d : priceChangePercentage7d // ignore: cast_nullable_to_non_nullable
as double?,priceChangePercentage30d: freezed == priceChangePercentage30d ? _self.priceChangePercentage30d : priceChangePercentage30d // ignore: cast_nullable_to_non_nullable
as double?,sparklineInUsd: freezed == sparklineInUsd ? _self.sparklineInUsd : sparklineInUsd // ignore: cast_nullable_to_non_nullable
as List<double>?,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,whitepaperUrl: freezed == whitepaperUrl ? _self.whitepaperUrl : whitepaperUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoinDetailsModel].
extension CoinDetailsModelPatterns on CoinDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _CoinDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _CoinDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  String? symbol,  String? image,  String? description,  List<String>? categories,  double? currentPrice,  int? marketCapRank,  double? marketCap,  double? totalVolume,  double? high24h,  double? low24h,  double? ath,  double? atl,  double? circulatingSupply,  double? maxSupply,  double? priceChangePercentage7d,  double? priceChangePercentage30d,  List<double>? sparklineInUsd,  String? websiteUrl,  String? whitepaperUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinDetailsModel() when $default != null:
return $default(_that.id,_that.name,_that.symbol,_that.image,_that.description,_that.categories,_that.currentPrice,_that.marketCapRank,_that.marketCap,_that.totalVolume,_that.high24h,_that.low24h,_that.ath,_that.atl,_that.circulatingSupply,_that.maxSupply,_that.priceChangePercentage7d,_that.priceChangePercentage30d,_that.sparklineInUsd,_that.websiteUrl,_that.whitepaperUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  String? symbol,  String? image,  String? description,  List<String>? categories,  double? currentPrice,  int? marketCapRank,  double? marketCap,  double? totalVolume,  double? high24h,  double? low24h,  double? ath,  double? atl,  double? circulatingSupply,  double? maxSupply,  double? priceChangePercentage7d,  double? priceChangePercentage30d,  List<double>? sparklineInUsd,  String? websiteUrl,  String? whitepaperUrl)  $default,) {final _that = this;
switch (_that) {
case _CoinDetailsModel():
return $default(_that.id,_that.name,_that.symbol,_that.image,_that.description,_that.categories,_that.currentPrice,_that.marketCapRank,_that.marketCap,_that.totalVolume,_that.high24h,_that.low24h,_that.ath,_that.atl,_that.circulatingSupply,_that.maxSupply,_that.priceChangePercentage7d,_that.priceChangePercentage30d,_that.sparklineInUsd,_that.websiteUrl,_that.whitepaperUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  String? symbol,  String? image,  String? description,  List<String>? categories,  double? currentPrice,  int? marketCapRank,  double? marketCap,  double? totalVolume,  double? high24h,  double? low24h,  double? ath,  double? atl,  double? circulatingSupply,  double? maxSupply,  double? priceChangePercentage7d,  double? priceChangePercentage30d,  List<double>? sparklineInUsd,  String? websiteUrl,  String? whitepaperUrl)?  $default,) {final _that = this;
switch (_that) {
case _CoinDetailsModel() when $default != null:
return $default(_that.id,_that.name,_that.symbol,_that.image,_that.description,_that.categories,_that.currentPrice,_that.marketCapRank,_that.marketCap,_that.totalVolume,_that.high24h,_that.low24h,_that.ath,_that.atl,_that.circulatingSupply,_that.maxSupply,_that.priceChangePercentage7d,_that.priceChangePercentage30d,_that.sparklineInUsd,_that.websiteUrl,_that.whitepaperUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoinDetailsModel implements CoinDetailsModel {
  const _CoinDetailsModel({this.id, this.name, this.symbol, this.image, this.description, final  List<String>? categories, this.currentPrice, this.marketCapRank, this.marketCap, this.totalVolume, this.high24h, this.low24h, this.ath, this.atl, this.circulatingSupply, this.maxSupply, this.priceChangePercentage7d, this.priceChangePercentage30d, final  List<double>? sparklineInUsd, this.websiteUrl, this.whitepaperUrl}): _categories = categories,_sparklineInUsd = sparklineInUsd;
  factory _CoinDetailsModel.fromJson(Map<String, dynamic> json) => _$CoinDetailsModelFromJson(json);

@override final  String? id;
@override final  String? name;
@override final  String? symbol;
@override final  String? image;
@override final  String? description;
 final  List<String>? _categories;
@override List<String>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double? currentPrice;
@override final  int? marketCapRank;
@override final  double? marketCap;
@override final  double? totalVolume;
@override final  double? high24h;
@override final  double? low24h;
@override final  double? ath;
@override final  double? atl;
@override final  double? circulatingSupply;
@override final  double? maxSupply;
@override final  double? priceChangePercentage7d;
@override final  double? priceChangePercentage30d;
 final  List<double>? _sparklineInUsd;
@override List<double>? get sparklineInUsd {
  final value = _sparklineInUsd;
  if (value == null) return null;
  if (_sparklineInUsd is EqualUnmodifiableListView) return _sparklineInUsd;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? websiteUrl;
@override final  String? whitepaperUrl;

/// Create a copy of CoinDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinDetailsModelCopyWith<_CoinDetailsModel> get copyWith => __$CoinDetailsModelCopyWithImpl<_CoinDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoinDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinDetailsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.image, image) || other.image == image)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.totalVolume, totalVolume) || other.totalVolume == totalVolume)&&(identical(other.high24h, high24h) || other.high24h == high24h)&&(identical(other.low24h, low24h) || other.low24h == low24h)&&(identical(other.ath, ath) || other.ath == ath)&&(identical(other.atl, atl) || other.atl == atl)&&(identical(other.circulatingSupply, circulatingSupply) || other.circulatingSupply == circulatingSupply)&&(identical(other.maxSupply, maxSupply) || other.maxSupply == maxSupply)&&(identical(other.priceChangePercentage7d, priceChangePercentage7d) || other.priceChangePercentage7d == priceChangePercentage7d)&&(identical(other.priceChangePercentage30d, priceChangePercentage30d) || other.priceChangePercentage30d == priceChangePercentage30d)&&const DeepCollectionEquality().equals(other._sparklineInUsd, _sparklineInUsd)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.whitepaperUrl, whitepaperUrl) || other.whitepaperUrl == whitepaperUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,symbol,image,description,const DeepCollectionEquality().hash(_categories),currentPrice,marketCapRank,marketCap,totalVolume,high24h,low24h,ath,atl,circulatingSupply,maxSupply,priceChangePercentage7d,priceChangePercentage30d,const DeepCollectionEquality().hash(_sparklineInUsd),websiteUrl,whitepaperUrl]);

@override
String toString() {
  return 'CoinDetailsModel(id: $id, name: $name, symbol: $symbol, image: $image, description: $description, categories: $categories, currentPrice: $currentPrice, marketCapRank: $marketCapRank, marketCap: $marketCap, totalVolume: $totalVolume, high24h: $high24h, low24h: $low24h, ath: $ath, atl: $atl, circulatingSupply: $circulatingSupply, maxSupply: $maxSupply, priceChangePercentage7d: $priceChangePercentage7d, priceChangePercentage30d: $priceChangePercentage30d, sparklineInUsd: $sparklineInUsd, websiteUrl: $websiteUrl, whitepaperUrl: $whitepaperUrl)';
}


}

/// @nodoc
abstract mixin class _$CoinDetailsModelCopyWith<$Res> implements $CoinDetailsModelCopyWith<$Res> {
  factory _$CoinDetailsModelCopyWith(_CoinDetailsModel value, $Res Function(_CoinDetailsModel) _then) = __$CoinDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? symbol, String? image, String? description, List<String>? categories, double? currentPrice, int? marketCapRank, double? marketCap, double? totalVolume, double? high24h, double? low24h, double? ath, double? atl, double? circulatingSupply, double? maxSupply, double? priceChangePercentage7d, double? priceChangePercentage30d, List<double>? sparklineInUsd, String? websiteUrl, String? whitepaperUrl
});




}
/// @nodoc
class __$CoinDetailsModelCopyWithImpl<$Res>
    implements _$CoinDetailsModelCopyWith<$Res> {
  __$CoinDetailsModelCopyWithImpl(this._self, this._then);

  final _CoinDetailsModel _self;
  final $Res Function(_CoinDetailsModel) _then;

/// Create a copy of CoinDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? symbol = freezed,Object? image = freezed,Object? description = freezed,Object? categories = freezed,Object? currentPrice = freezed,Object? marketCapRank = freezed,Object? marketCap = freezed,Object? totalVolume = freezed,Object? high24h = freezed,Object? low24h = freezed,Object? ath = freezed,Object? atl = freezed,Object? circulatingSupply = freezed,Object? maxSupply = freezed,Object? priceChangePercentage7d = freezed,Object? priceChangePercentage30d = freezed,Object? sparklineInUsd = freezed,Object? websiteUrl = freezed,Object? whitepaperUrl = freezed,}) {
  return _then(_CoinDetailsModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double?,marketCapRank: freezed == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int?,marketCap: freezed == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double?,totalVolume: freezed == totalVolume ? _self.totalVolume : totalVolume // ignore: cast_nullable_to_non_nullable
as double?,high24h: freezed == high24h ? _self.high24h : high24h // ignore: cast_nullable_to_non_nullable
as double?,low24h: freezed == low24h ? _self.low24h : low24h // ignore: cast_nullable_to_non_nullable
as double?,ath: freezed == ath ? _self.ath : ath // ignore: cast_nullable_to_non_nullable
as double?,atl: freezed == atl ? _self.atl : atl // ignore: cast_nullable_to_non_nullable
as double?,circulatingSupply: freezed == circulatingSupply ? _self.circulatingSupply : circulatingSupply // ignore: cast_nullable_to_non_nullable
as double?,maxSupply: freezed == maxSupply ? _self.maxSupply : maxSupply // ignore: cast_nullable_to_non_nullable
as double?,priceChangePercentage7d: freezed == priceChangePercentage7d ? _self.priceChangePercentage7d : priceChangePercentage7d // ignore: cast_nullable_to_non_nullable
as double?,priceChangePercentage30d: freezed == priceChangePercentage30d ? _self.priceChangePercentage30d : priceChangePercentage30d // ignore: cast_nullable_to_non_nullable
as double?,sparklineInUsd: freezed == sparklineInUsd ? _self._sparklineInUsd : sparklineInUsd // ignore: cast_nullable_to_non_nullable
as List<double>?,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,whitepaperUrl: freezed == whitepaperUrl ? _self.whitepaperUrl : whitepaperUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
