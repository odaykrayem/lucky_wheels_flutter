// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignUpBody {
  String firstName;
  String lastName;
  String phone;
  // String email;
  String? regReferralCode;
  String password;

  SignUpBody({
    required this.firstName,
    required this.lastName,
    required this.phone,
    // required this.email,
    this.regReferralCode,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['f_name'] = firstName;
    data['l_name'] = lastName;
    data['phone'] = phone;
    // data['email'] = email;
    data['password'] = password;
    if (regReferralCode != null) data['ref_code'] = regReferralCode;

    return data;
  }

  @override
  String toString() {
    return 'SignUpBody(name: $firstName, phone: $phone, phone: $phone, password: $password)';
  }
}
