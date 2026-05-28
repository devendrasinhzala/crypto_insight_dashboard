import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../dashboard/domain/entities/coin_entity.dart';

part 'viewed_coins_summary_model.freezed.dart';

@freezed
abstract class ViewedCoinsSummaryModel with _$ViewedCoinsSummaryModel {
  const factory ViewedCoinsSummaryModel({
    required int viewedCount,
    required double averagePrice,
    required CoinEntity bestPerformer,
    required CoinEntity worstPerformer,
  }) = _ViewedCoinsSummaryModel;
}
