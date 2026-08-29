import 'package:flutter/foundation.dart';
import 'package:bareeq/models/wallet_model.dart';

class WalletProvider extends ChangeNotifier {
WalletModel? _wallet;

WalletModel? get wallet => _wallet;

void createWallet(String userId) {
_wallet = WalletModel(
userId: userId,
updatedAt: DateTime.now(),
);
notifyListeners();
}

void addCompletedRequest({
required double requestPrice,
double commissionRate = 0.15,
}) {
if (_wallet == null) return;

final companyCommission = requestPrice * commissionRate;
final rescuerEarnings = requestPrice - companyCommission;

_wallet = _wallet!.copyWith(
  totalEarnings: _wallet!.totalEarnings + rescuerEarnings,
  availableBalance: _wallet!.availableBalance + rescuerEarnings,
  companyCommission:
      _wallet!.companyCommission + companyCommission,
  updatedAt: DateTime.now(),
);

notifyListeners();

}

void withdraw(double amount) {
if (_wallet == null) return;
if (amount <= 0 || amount > _wallet!.availableBalance) return;

_wallet = _wallet!.copyWith(
  availableBalance: _wallet!.availableBalance - amount,
  withdrawnAmount: _wallet!.withdrawnAmount + amount,
  updatedAt: DateTime.now(),
);

notifyListeners();

}

void clearWallet() {
_wallet = null;
notifyListeners();
}
}
