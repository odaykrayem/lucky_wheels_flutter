// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  int id;
  String firstName;
  String lastName;
  String phone;
  int points;
  double balance;
  String referralCode;
  int refTimes;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.points,
    required this.balance,
    required this.referralCode,
    required this.refTimes,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
      points: json['points'],
      balance: json['balance'],
      refTimes: json['ref_times'],
      referralCode: json['referral_code'],
    );
  }
}
