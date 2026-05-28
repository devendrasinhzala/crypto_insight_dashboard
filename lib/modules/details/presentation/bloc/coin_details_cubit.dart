import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/coin_details_entity.dart';
import '../../domain/usecases/get_coin_details_usecase.dart';

enum CoinDetailsStatus { initial, loading, success, error }

class CoinDetailsState {
  const CoinDetailsState({
    this.status = CoinDetailsStatus.initial,
    this.details,
    this.message,
  });

  final CoinDetailsStatus status;
  final CoinDetailsEntity? details;
  final String? message;

  CoinDetailsState copyWith({
    CoinDetailsStatus? status,
    CoinDetailsEntity? details,
    String? message,
  }) {
    return CoinDetailsState(
      status: status ?? this.status,
      details: details ?? this.details,
      message: message ?? this.message,
    );
  }
}

class CoinDetailsCubit extends Cubit<CoinDetailsState> {
  CoinDetailsCubit(this._getCoinDetailsUseCase) : super(const CoinDetailsState());

  final GetCoinDetailsUseCase _getCoinDetailsUseCase;

  Future<void> fetchDetails(String id) async {
    emit(state.copyWith(status: CoinDetailsStatus.loading, message: null));
    try {
      final details = await _getCoinDetailsUseCase(id: id);
      emit(
        state.copyWith(
          status: CoinDetailsStatus.success,
          details: details,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: CoinDetailsStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
}

