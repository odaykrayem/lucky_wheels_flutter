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
  // String token;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.points,
    required this.balance,
    required this.referralCode,
    required this.refTimes,
    // required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['f_name'],
      lastName: json['l_name'],
      phone: json['phone'],
      points: json['points'],
      balance: double.parse('${json['balance']}'),
      refTimes: json['ref_times'],
      referralCode: json['ref_code'],
      // token: json['token']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'f_name': firstName,
      'l_name': lastName,
      'phone': phone,
      'points': points,
      'balance': balance,
      'ref_times': refTimes,
      'ref_code': referralCode,
      // 'token': token,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
