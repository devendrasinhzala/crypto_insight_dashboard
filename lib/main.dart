import 'package:flutter/material.dart';

import 'core/constants/app_strings.dart';
import 'core/di/injection_container.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      routerConfig: appRouter,
      theme: AppTheme.lightTheme,
    );
  }
}
