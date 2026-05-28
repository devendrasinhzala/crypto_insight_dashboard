import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/viewed_coins_summary_model.dart';

part 'summary_state.freezed.dart';

@freezed
class SummaryState with _$SummaryState {
  const factory SummaryState.initial() = _Initial;
  const factory SummaryState.loading() = _Loading;
  const factory SummaryState.success({
    required ViewedCoinsSummaryModel summary,
  }) = _Success;
  const factory SummaryState.insufficientData() = _InsufficientData;
  const factory SummaryState.error({required String message}) = _Error;
}
