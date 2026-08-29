import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bareeq/config/app_routes.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اختر نوع الحساب'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'كيف تريد استخدام بريق؟ ✨',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () => context.go(AppRoutes.hostHome),
                icon: const Icon(Icons.home),
                label: const Text(
                  'أنا مستضيف',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () => context.go(AppRoutes.rescuerHome),
                icon: const Icon(Icons.cleaning_services),
                label: const Text(
                  'أنا منقذ',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
