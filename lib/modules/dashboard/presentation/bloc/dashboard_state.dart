import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/coin_entity.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  /// Initial state
  const factory DashboardState.initial() = _Initial;

  /// Loading state
  const factory DashboardState.loading() = _Loading;

  /// Success state
  const factory DashboardState.success({
    required List<CoinEntity> coins,
    required List<CoinEntity> recentlyViewed,
  }) = _Success;

  /// Error state
  const factory DashboardState.error({
    required String message,
  }) = _Error;
}