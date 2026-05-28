import 'package:crypto_insight_dashboard/modules/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:crypto_insight_dashboard/modules/details/presentation/screens/coin_details_screen.dart';
import 'package:crypto_insight_dashboard/modules/summary/presentation/screens/summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_strings.dart';
import '../di/injection_container.dart';
import '../../modules/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../../modules/details/presentation/bloc/coin_details_cubit.dart';
import '../../modules/navigation/presentation/main_screen.dart';
import '../../modules/summary/presentation/cubit/summary_cubit.dart';

part 'app_router.g.dart';

class AppRouteConstants {
  const AppRouteConstants._();

  static const String dashboardName = 'dashboard';
  static const String coinDetailsName = 'coinDetails';
  static const String summaryName = 'summary';
  static const String walletName = 'wallet';
  static const String tradesName = 'trades';
  static const String portfolioName = 'portfolio';

  static const String dashboardPath = '/dashboard';
  static const String coinDetailsPath = 'coin/:id';
  static const String summaryPath = 'summary';
  static const String walletPath = '/wallet';
  static const String tradesPath = '/trades';
  static const String portfolioPath = '/portfolio';
}

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<DashboardBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<DashboardRouteData>(
          path: AppRouteConstants.dashboardPath,
          name: AppRouteConstants.dashboardName,
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<CoinDetailsRouteData>(
              path: AppRouteConstants.coinDetailsPath,
              name: AppRouteConstants.coinDetailsName,
            ),
            TypedGoRoute<SummaryRouteData>(
              path: AppRouteConstants.summaryPath,
              name: AppRouteConstants.summaryName,
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<WalletBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<WalletRouteData>(
          path: AppRouteConstants.walletPath,
          name: AppRouteConstants.walletName,
        ),
      ],
    ),
    TypedStatefulShellBranch<TradesBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<TradesRouteData>(
          path: AppRouteConstants.tradesPath,
          name: AppRouteConstants.tradesName,
        ),
      ],
    ),
    TypedStatefulShellBranch<PortfolioBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<PortfolioRouteData>(
          path: AppRouteConstants.portfolioPath,
          name: AppRouteConstants.portfolioName,
        ),
      ],
    ),
  ],
)
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MainScreen(navigationShell: navigationShell);
  }
}

class DashboardBranchData extends StatefulShellBranchData {
  const DashboardBranchData();
}

class WalletBranchData extends StatefulShellBranchData {
  const WalletBranchData();
}

class TradesBranchData extends StatefulShellBranchData {
  const TradesBranchData();
}

class PortfolioBranchData extends StatefulShellBranchData {
  const PortfolioBranchData();
}

class DashboardRouteData extends GoRouteData with $DashboardRouteData {
  const DashboardRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider<DashboardBloc>(
      create: (_) => sl<DashboardBloc>(),
      child: const DashboardScreen(),
    );
  }
}

class CoinDetailsRouteData extends GoRouteData with $CoinDetailsRouteData {
  const CoinDetailsRouteData({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider<CoinDetailsCubit>(
      create: (_) => sl<CoinDetailsCubit>(),
      child: CoinDetailsScreen(coinId: id),
    );
  }
}

class SummaryRouteData extends GoRouteData with $SummaryRouteData {
  const SummaryRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider<SummaryCubit>(
      create: (_) => sl<SummaryCubit>()..loadSummary(),
      child: const SummaryScreen(),
    );
  }
}

class WalletRouteData extends GoRouteData with $WalletRouteData {
  const WalletRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const _TabView(title: AppStrings.wallet);
  }
}

class TradesRouteData extends GoRouteData with $TradesRouteData {
  const TradesRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const _TabView(title: AppStrings.trades);
  }
}

class PortfolioRouteData extends GoRouteData with $PortfolioRouteData {
  const PortfolioRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const _TabView(title: AppStrings.portfolio);
  }
}

class _TabView extends StatelessWidget {
  const _TabView({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}

final GoRouter appRouter = GoRouter(
  routes: $appRoutes,
  initialLocation: AppRouteConstants.dashboardPath,
);
