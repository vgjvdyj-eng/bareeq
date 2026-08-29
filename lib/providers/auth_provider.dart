import 'package:flutter/foundation.dart';
import 'package:bareeq/models/user_model.dart';
import 'package:bareeq/models/enums.dart';
import 'package:bareeq/services/local_storage_service.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _currentUser;
  bool _isLoading = false;

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _currentUser != null;

  Future<void> loadUser() async {
    _isLoading = true;
    notifyListeners();

    final userJson = LocalStorageService.getString('current_user');

    if (userJson != null) {
      try {
        // سيتم استكمال فك بيانات المستخدم عند ربط التخزين بالحسابات.
      } catch (_) {
        _currentUser = null;
      }
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    // نظام الدخول المحلي المؤقت.
    // سيتم ربطه بنظام الحسابات الكامل لاحقًا.

    _isLoading = false;
    notifyListeners();
  }

  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required UserRole role,
    String profileImage = '',
    String? identityImage,
  }) async {
    _isLoading = true;
    notifyListeners();

    _currentUser = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      phone: phone,
      profileImage: profileImage,
      role: role,
      createdAt: DateTime.now(),
      identityImage: identityImage,
      verificationStatus: role == UserRole.rescuer
          ? RescuerVerificationStatus.pending
          : null,
      rating: role == UserRole.rescuer ? 0 : null,
      completedRequests: role == UserRole.rescuer ? 0 : null,
    );

    _isLoading = false;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    LocalStorageService.remove('current_user');
    notifyListeners();
  }
}
