import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/coin_entity.dart';

part 'dashboard_event.freezed.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  /// Fetch all coins initially
  const factory DashboardEvent.fetchCoin() = _FetchCoin;

  /// Pull to refresh coins
  const factory DashboardEvent.refreshCoin() = _RefreshCoin;

  /// Search coins
  const factory DashboardEvent.searchCoin({
    required String query,
  }) = _SearchCoin;

  /// Track recently viewed coin by user click
  const factory DashboardEvent.coinViewed({
    required CoinEntity coin,
  }) = _CoinViewed;
}