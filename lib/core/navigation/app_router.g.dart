// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$mainShellRouteData];

RouteBase get $mainShellRouteData => StatefulShellRouteData.$route(
  factory: $MainShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/dashboard',
          name: 'dashboard',
          factory: $DashboardRouteData._fromState,
          routes: [
            GoRouteData.$route(
              path: 'coin/:id',
              name: 'coinDetails',
              factory: $CoinDetailsRouteData._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/wallet',
          name: 'wallet',
          factory: $WalletRouteData._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/trades',
          name: 'trades',
          factory: $TradesRouteData._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/portfolio',
          name: 'portfolio',
          factory: $PortfolioRouteData._fromState,
        ),
      ],
    ),
  ],
);

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

mixin $DashboardRouteData on GoRouteData {
  static DashboardRouteData _fromState(GoRouterState state) =>
      const DashboardRouteData();

  @override
  String get location => GoRouteData.$location('/dashboard');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CoinDetailsRouteData on GoRouteData {
  static CoinDetailsRouteData _fromState(GoRouterState state) =>
      CoinDetailsRouteData(id: state.pathParameters['id']!);

  CoinDetailsRouteData get _self => this as CoinDetailsRouteData;

  @override
  String get location =>
      GoRouteData.$location('/dashboard/coin/${Uri.encodeComponent(_self.id)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $WalletRouteData on GoRouteData {
  static WalletRouteData _fromState(GoRouterState state) =>
      const WalletRouteData();

  @override
  String get location => GoRouteData.$location('/wallet');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $TradesRouteData on GoRouteData {
  static TradesRouteData _fromState(GoRouterState state) =>
      const TradesRouteData();

  @override
  String get location => GoRouteData.$location('/trades');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PortfolioRouteData on GoRouteData {
  static PortfolioRouteData _fromState(GoRouterState state) =>
      const PortfolioRouteData();

  @override
  String get location => GoRouteData.$location('/portfolio');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
