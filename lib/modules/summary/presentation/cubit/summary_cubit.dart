import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_viewed_coins_summary_usecase.dart';
import 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  SummaryCubit(this._getViewedCoinsSummaryUseCase)
    : super(const SummaryState.initial());

  final GetViewedCoinsSummaryUseCase _getViewedCoinsSummaryUseCase;

  Future<void> loadSummary() async {
    emit(const SummaryState.loading());

    try {
      final summary = await _getViewedCoinsSummaryUseCase();
      if (summary == null) {
        emit(const SummaryState.insufficientData());
        return;
      }

      emit(SummaryState.success(summary: summary));
    } catch (e) {
      emit(SummaryState.error(message: e.toString()));
    }
  }
}
