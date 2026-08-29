class WalletModel {
final String userId;
final double totalEarnings;
final double availableBalance;
final double companyCommission;
final double withdrawnAmount;
final DateTime updatedAt;

const WalletModel({
required this.userId,
this.totalEarnings = 0,
this.availableBalance = 0,
this.companyCommission = 0,
this.withdrawnAmount = 0,
required this.updatedAt,
});

WalletModel copyWith({
double? totalEarnings,
double? availableBalance,
double? companyCommission,
double? withdrawnAmount,
DateTime? updatedAt,
}) {
return WalletModel(
userId: userId,
totalEarnings: totalEarnings ?? this.totalEarnings,
availableBalance: availableBalance ?? this.availableBalance,
companyCommission: companyCommission ?? this.companyCommission,
withdrawnAmount: withdrawnAmount ?? this.withdrawnAmount,
updatedAt: updatedAt ?? this.updatedAt,
);
}

Map<String, dynamic> toJson() => {
'userId': userId,
'totalEarnings': totalEarnings,
'availableBalance': availableBalance,
'companyCommission': companyCommission,
'withdrawnAmount': withdrawnAmount,
'updatedAt': updatedAt.toIso8601String(),
};

factory WalletModel.fromJson(Map<String, dynamic> json) {
return WalletModel(
userId: json['userId'] as String,
totalEarnings: (json['totalEarnings'] as num?)?.toDouble() ?? 0,
availableBalance: (json['availableBalance'] as num?)?.toDouble() ?? 0,
companyCommission: (json['companyCommission'] as num?)?.toDouble() ?? 0,
withdrawnAmount: (json['withdrawnAmount'] as num?)?.toDouble() ?? 0,
updatedAt: DateTime.parse(json['updatedAt'] as String),
);
}
}
