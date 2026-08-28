import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:bareeq/config/theme.dart';
import 'package:bareeq/config/app_routes.dart';
import 'package:bareeq/providers/auth_provider.dart';
import 'package:bareeq/providers/request_provider.dart';
import 'package:bareeq/providers/wallet_provider.dart';
import 'package:bareeq/services/local_storage_service.dart';
import 'package:go_router/go_router.dart';
import 'package:bareeq/screens/splash_screen.dart';
import 'package:bareeq/screens/auth/login_screen.dart';
import 'package:bareeq/screens/auth/register_screen.dart';
import 'package:bareeq/screens/auth/role_selection_screen.dart';
import 'package:bareeq/screens/host/host_home_screen.dart';
import 'package:bareeq/screens/rescuer/rescuer_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => RequestProvider()),
        ChangeNotifierProvider(create: (_) => WalletProvider()),
      ],
      child: const BareeqApp(),
    ),
  );
}

class BareeqApp extends StatelessWidget {
  const BareeqApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'بريق',
          theme: AppTheme.lightTheme,
          routerConfig: _buildGoRouter(),
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          supportedLocales: const [Locale('ar')],
        );
      },
    );
  }

  GoRouter _buildGoRouter() {
    return GoRouter(
      initialLocation: AppRoutes.splash,
      routes: [
        GoRoute(
          path: AppRoutes.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppRoutes.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: AppRoutes.register,
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: AppRoutes.roleSelection,
          builder: (context, state) => const RoleSelectionScreen(),
        ),
        GoRoute(
          path: AppRoutes.hostHome,
          builder: (context, state) => const HostHomeScreen(),
        ),
        GoRoute(
          path: AppRoutes.rescuerHome,
          builder: (context, state) => const RescuerHomeScreen(),
        ),
      ],
    );
  }
}
