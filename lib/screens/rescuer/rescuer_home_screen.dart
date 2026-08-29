import 'package:flutter/material.dart';
import 'package:bareeq/models/enums.dart';

class RescuerHomeScreen extends StatelessWidget {
  const RescuerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = ServiceType.values;

    return Scaffold(
      appBar: AppBar(
        title: const Text('بريق - المنقذ ✨'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_balance_wallet_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'أهلاً بك أيها المنقذ 👋',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'اختر الخدمات التي تقدمها وشوف الطلبات المتاحة.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            const Text(
              'الخدمات المتاحة',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            ...services.map(
              (service) => Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: Text(
                    service.emoji,
                    style: const TextStyle(fontSize: 28),
                  ),
                  title: Text(service.displayName),
                  subtitle: Text(
                    'السعر الأدنى: ${service.minimumPrice.toStringAsFixed(0)} د.ل',
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
            ),

            const SizedBox(height: 15),

            Card(
              child: ListTile(
                leading: const Icon(Icons.pending_actions),
                title: const Text('الطلبات المتاحة'),
                subtitle: const Text(
                  'شاهد طلبات المستضيفين واقبل الطلب المناسب لك',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(Icons.account_balance_wallet),
                title: const Text('المحفظة'),
                subtitle: const Text(
                  'تابع أرباحك وعمولة شركة بريق',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
