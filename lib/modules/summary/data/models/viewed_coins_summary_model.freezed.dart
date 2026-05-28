// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'viewed_coins_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ViewedCoinsSummaryModel {

 int get viewedCount; double get averagePrice; CoinEntity get bestPerformer; CoinEntity get worstPerformer;
/// Create a copy of ViewedCoinsSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewedCoinsSummaryModelCopyWith<ViewedCoinsSummaryModel> get copyWith => _$ViewedCoinsSummaryModelCopyWithImpl<ViewedCoinsSummaryModel>(this as ViewedCoinsSummaryModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewedCoinsSummaryModel&&(identical(other.viewedCount, viewedCount) || other.viewedCount == viewedCount)&&(identical(other.averagePrice, averagePrice) || other.averagePrice == averagePrice)&&(identical(other.bestPerformer, bestPerformer) || other.bestPerformer == bestPerformer)&&(identical(other.worstPerformer, worstPerformer) || other.worstPerformer == worstPerformer));
}


@override
int get hashCode => Object.hash(runtimeType,viewedCount,averagePrice,bestPerformer,worstPerformer);

@override
String toString() {
  return 'ViewedCoinsSummaryModel(viewedCount: $viewedCount, averagePrice: $averagePrice, bestPerformer: $bestPerformer, worstPerformer: $worstPerformer)';
}


}

/// @nodoc
abstract mixin class $ViewedCoinsSummaryModelCopyWith<$Res>  {
  factory $ViewedCoinsSummaryModelCopyWith(ViewedCoinsSummaryModel value, $Res Function(ViewedCoinsSummaryModel) _then) = _$ViewedCoinsSummaryModelCopyWithImpl;
@useResult
$Res call({
 int viewedCount, double averagePrice, CoinEntity bestPerformer, CoinEntity worstPerformer
});




}
/// @nodoc
class _$ViewedCoinsSummaryModelCopyWithImpl<$Res>
    implements $ViewedCoinsSummaryModelCopyWith<$Res> {
  _$ViewedCoinsSummaryModelCopyWithImpl(this._self, this._then);

  final ViewedCoinsSummaryModel _self;
  final $Res Function(ViewedCoinsSummaryModel) _then;

/// Create a copy of ViewedCoinsSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? viewedCount = null,Object? averagePrice = null,Object? bestPerformer = null,Object? worstPerformer = null,}) {
  return _then(_self.copyWith(
viewedCount: null == viewedCount ? _self.viewedCount : viewedCount // ignore: cast_nullable_to_non_nullable
as int,averagePrice: null == averagePrice ? _self.averagePrice : averagePrice // ignore: cast_nullable_to_non_nullable
as double,bestPerformer: null == bestPerformer ? _self.bestPerformer : bestPerformer // ignore: cast_nullable_to_non_nullable
as CoinEntity,worstPerformer: null == worstPerformer ? _self.worstPerformer : worstPerformer // ignore: cast_nullable_to_non_nullable
as CoinEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [ViewedCoinsSummaryModel].
extension ViewedCoinsSummaryModelPatterns on ViewedCoinsSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViewedCoinsSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViewedCoinsSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViewedCoinsSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _ViewedCoinsSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViewedCoinsSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ViewedCoinsSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int viewedCount,  double averagePrice,  CoinEntity bestPerformer,  CoinEntity worstPerformer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViewedCoinsSummaryModel() when $default != null:
return $default(_that.viewedCount,_that.averagePrice,_that.bestPerformer,_that.worstPerformer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int viewedCount,  double averagePrice,  CoinEntity bestPerformer,  CoinEntity worstPerformer)  $default,) {final _that = this;
switch (_that) {
case _ViewedCoinsSummaryModel():
return $default(_that.viewedCount,_that.averagePrice,_that.bestPerformer,_that.worstPerformer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int viewedCount,  double averagePrice,  CoinEntity bestPerformer,  CoinEntity worstPerformer)?  $default,) {final _that = this;
switch (_that) {
case _ViewedCoinsSummaryModel() when $default != null:
return $default(_that.viewedCount,_that.averagePrice,_that.bestPerformer,_that.worstPerformer);case _:
  return null;

}
}

}

/// @nodoc


class _ViewedCoinsSummaryModel implements ViewedCoinsSummaryModel {
  const _ViewedCoinsSummaryModel({required this.viewedCount, required this.averagePrice, required this.bestPerformer, required this.worstPerformer});
  

@override final  int viewedCount;
@override final  double averagePrice;
@override final  CoinEntity bestPerformer;
@override final  CoinEntity worstPerformer;

/// Create a copy of ViewedCoinsSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewedCoinsSummaryModelCopyWith<_ViewedCoinsSummaryModel> get copyWith => __$ViewedCoinsSummaryModelCopyWithImpl<_ViewedCoinsSummaryModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewedCoinsSummaryModel&&(identical(other.viewedCount, viewedCount) || other.viewedCount == viewedCount)&&(identical(other.averagePrice, averagePrice) || other.averagePrice == averagePrice)&&(identical(other.bestPerformer, bestPerformer) || other.bestPerformer == bestPerformer)&&(identical(other.worstPerformer, worstPerformer) || other.worstPerformer == worstPerformer));
}


@override
int get hashCode => Object.hash(runtimeType,viewedCount,averagePrice,bestPerformer,worstPerformer);

@override
String toString() {
  return 'ViewedCoinsSummaryModel(viewedCount: $viewedCount, averagePrice: $averagePrice, bestPerformer: $bestPerformer, worstPerformer: $worstPerformer)';
}


}

/// @nodoc
abstract mixin class _$ViewedCoinsSummaryModelCopyWith<$Res> implements $ViewedCoinsSummaryModelCopyWith<$Res> {
  factory _$ViewedCoinsSummaryModelCopyWith(_ViewedCoinsSummaryModel value, $Res Function(_ViewedCoinsSummaryModel) _then) = __$ViewedCoinsSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 int viewedCount, double averagePrice, CoinEntity bestPerformer, CoinEntity worstPerformer
});




}
/// @nodoc
class __$ViewedCoinsSummaryModelCopyWithImpl<$Res>
    implements _$ViewedCoinsSummaryModelCopyWith<$Res> {
  __$ViewedCoinsSummaryModelCopyWithImpl(this._self, this._then);

  final _ViewedCoinsSummaryModel _self;
  final $Res Function(_ViewedCoinsSummaryModel) _then;

/// Create a copy of ViewedCoinsSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? viewedCount = null,Object? averagePrice = null,Object? bestPerformer = null,Object? worstPerformer = null,}) {
  return _then(_ViewedCoinsSummaryModel(
viewedCount: null == viewedCount ? _self.viewedCount : viewedCount // ignore: cast_nullable_to_non_nullable
as int,averagePrice: null == averagePrice ? _self.averagePrice : averagePrice // ignore: cast_nullable_to_non_nullable
as double,bestPerformer: null == bestPerformer ? _self.bestPerformer : bestPerformer // ignore: cast_nullable_to_non_nullable
as CoinEntity,worstPerformer: null == worstPerformer ? _self.worstPerformer : worstPerformer // ignore: cast_nullable_to_non_nullable
as CoinEntity,
  ));
}


}

// dart format on
