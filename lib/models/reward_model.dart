// ignore_for_file: public_member_api_docs, sort_constructors_first

class RewardModel {
  final int id;
  final int value;
  final int duration;
  final bool isOn;

  RewardModel({
    required this.id,
    required this.value,
    required this.duration,
    required this.isOn,
  });

  factory RewardModel.fromJson(Map<String, dynamic> json) {
    return RewardModel(
      id: json['id'],
      value: json['value'],
      duration: json['duration'],
      isOn: json['is_on'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'value': value,
      'duration': duration,
      'is_on': isOn,
    };
  }

  set isOn(bool val) {
    isOn = val;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
