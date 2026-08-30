import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bareeq/config/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      context.go(AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cleaning_services,
              size: 90,
            ),
            const SizedBox(height: 20),
            Text(
              'بريق',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              'نخلي كل شيء يلمع ✨',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
