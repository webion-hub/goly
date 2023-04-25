import 'dart:convert';

class ReportModel {
  final String uid;
  final String errorType;
  final String message;
  ReportModel({
    required this.uid,
    required this.errorType,
    required this.message,
  });

  ReportModel copyWith({
    String? uid,
    String? errorType,
    String? message,
  }) {
    return ReportModel(
      uid: uid ?? this.uid,
      errorType: errorType ?? this.errorType,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'errorType': errorType,
      'message': message,
    };
  }

  factory ReportModel.fromMap(Map<String, dynamic> map) {
    return ReportModel(
      uid: map['uid'] as String,
      errorType: map['errorType'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportModel.fromJson(String source) => ReportModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ReportModel(uid: $uid, errorType: $errorType, message: $message)';

  @override
  bool operator ==(covariant ReportModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid && other.errorType == errorType && other.message == message;
  }

  @override
  int get hashCode => uid.hashCode ^ errorType.hashCode ^ message.hashCode;
}
