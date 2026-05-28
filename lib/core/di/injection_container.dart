import 'package:get_it/get_it.dart';

import '../../core/constants/app_constants.dart';
import '../../modules/dashboard/data/datasources/dashboard_local_datasource.dart';
import '../../modules/dashboard/data/datasources/dashboard_remote_datasource.dart';
import '../../modules/dashboard/data/repositories/dashboard_repository_impl.dart';
import '../../modules/dashboard/domain/repositories/dashboard_repository.dart';
import '../../modules/dashboard/domain/usecases/fetch_coins_usecase.dart';
import '../../modules/dashboard/domain/usecases/get_cached_coins_usecase.dart';
import '../../modules/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../../modules/details/data/datasources/coin_details_remote_datasource.dart';
import '../../modules/details/data/repositories/coin_details_repository_impl.dart';
import '../../modules/details/domain/repositories/coin_details_repository.dart';
import '../../modules/details/domain/usecases/get_coin_details_usecase.dart';
import '../../modules/details/presentation/bloc/coin_details_cubit.dart';
import '../../modules/shared/recently_viewed/data/datasources/recently_viewed_local_datasource.dart';
import '../../modules/shared/recently_viewed/data/repositories/recently_viewed_repository_impl.dart';
import '../../modules/shared/recently_viewed/domain/repositories/recently_viewed_repository.dart';
import '../../modules/shared/recently_viewed/domain/usecases/get_recently_viewed_coins_usecase.dart';
import '../../modules/shared/recently_viewed/domain/usecases/save_recently_viewed_coin_usecase.dart';
import '../../modules/summary/domain/usecases/get_viewed_coins_summary_usecase.dart';
import '../../modules/summary/presentation/cubit/summary_cubit.dart';
import '../network/api_client.dart';
import '../network/endpoints.dart';
import '../storage/hive_storage.dart';

final GetIt sl = GetIt.instance;

Future<void> setupDependencies() async {
  final hiveStorage = const HiveStorage();
  await hiveStorage.init();
  final dashboardCacheBox = await hiveStorage.openBox(
    AppConstants.dashboardCacheBox,
  );

  sl.registerLazySingleton<HiveStorage>(() => hiveStorage);

  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(baseUrl: Endpoints.baseUrl),
  );

  sl.registerLazySingleton<DashboardLocalDataSource>(
    () => DashboardLocalDataSourceImpl(dashboardCacheBox),
  );
  sl.registerLazySingleton<RecentlyViewedLocalDataSource>(
    () => RecentlyViewedLocalDataSourceImpl(dashboardCacheBox),
  );

  sl.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImpl(sl<ApiClient>()),
  );
  sl.registerLazySingleton<CoinDetailsRemoteDataSource>(
    () => CoinDetailsRemoteDataSourceImpl(sl<ApiClient>()),
  );

  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      sl<DashboardRemoteDataSource>(),
      sl<DashboardLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton<CoinDetailsRepository>(
    () => CoinDetailsRepositoryImpl(sl<CoinDetailsRemoteDataSource>()),
  );
  sl.registerLazySingleton<RecentlyViewedRepository>(
    () => RecentlyViewedRepositoryImpl(sl<RecentlyViewedLocalDataSource>()),
  );

  sl.registerLazySingleton<FetchCoinsUseCase>(
    () => FetchCoinsUseCase(sl<DashboardRepository>()),
  );

  sl.registerLazySingleton<GetCachedCoinsUseCase>(
    () => GetCachedCoinsUseCase(sl<DashboardRepository>()),
  );
  sl.registerLazySingleton<GetRecentlyViewedCoinsUseCase>(
    () => GetRecentlyViewedCoinsUseCase(sl<RecentlyViewedRepository>()),
  );
  sl.registerLazySingleton<SaveRecentlyViewedCoinUseCase>(
    () => SaveRecentlyViewedCoinUseCase(sl<RecentlyViewedRepository>()),
  );
  sl.registerLazySingleton<GetViewedCoinsSummaryUseCase>(
    () => GetViewedCoinsSummaryUseCase(sl<GetRecentlyViewedCoinsUseCase>()),
  );
  sl.registerLazySingleton<GetCoinDetailsUseCase>(
    () => GetCoinDetailsUseCase(sl<CoinDetailsRepository>()),
  );

  sl.registerFactory<DashboardBloc>(
    () => DashboardBloc(
      fetchCoinsUseCase: sl<FetchCoinsUseCase>(),
      getCachedCoinsUseCase: sl<GetCachedCoinsUseCase>(),
      getRecentlyViewedCoinsUseCase: sl<GetRecentlyViewedCoinsUseCase>(),
      saveRecentlyViewedCoinUseCase: sl<SaveRecentlyViewedCoinUseCase>(),
    ),
  );
  sl.registerFactory<CoinDetailsCubit>(
    () => CoinDetailsCubit(sl<GetCoinDetailsUseCase>()),
  );
  sl.registerFactory<SummaryCubit>(
    () => SummaryCubit(sl<GetViewedCoinsSummaryUseCase>()),
  );
}
