// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class ContestModel {
  final int id;
  final String? description;
  final int prize;
  final int duration;
  final bool isFinished;
  final bool isParticipant;
  final DateTime createdAt;

  ContestModel(
      {required this.id,
      required this.description,
      required this.prize,
      required this.duration,
      required this.isFinished,
      required this.isParticipant,
      required this.createdAt});

  factory ContestModel.fromJson(Map<String, dynamic> json) {
    return ContestModel(
        id: json['id'],
        description: json['description'],
        prize: json['prize'],
        duration: json['duration'],
        isFinished: json['is_finished'],
        isParticipant: json['is_participant'],
        createdAt: DateFormat("yyyy-MM-dd hh:mm")
            .parse(DateTime.parse(json['created_at'] as String).toString()));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'prize': prize,
      'duration': duration,
      'is_finished': isFinished,
      'is_participant': isParticipant,
      'created_at': createdAt
    };
  }

  set isParticipant(bool val) {
    isParticipant = val;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
