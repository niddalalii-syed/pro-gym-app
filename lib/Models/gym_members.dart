import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class gymmembers {
  final String member_id;
  final String member_name;
  final String member_phone;
  final String member_admissionDate;

  gymmembers({
    required this.member_id,
    required this.member_name,
    required this.member_phone,
    required this.member_admissionDate
  });

  @override
  String toString() {
    return 'members(member_id: $member_id, member_name: $member_name, member_phone: $member_phone, member_admissionDate: $member_admissionDate)';
  }

  gymmembers copyWith({
    String? member_id,
    String? member_name,
    String? member_phone,
    String? member_admissionDate,
  }) {
    return gymmembers(
      member_id: member_id ?? this.member_id,
      member_name: member_name ?? this.member_name,
      member_phone: member_phone ?? this.member_phone,
      member_admissionDate: member_admissionDate ?? this.member_admissionDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'member_id': member_id,
      'member_name': member_name,
      'member_phone': member_phone,
      'member_admissionDate': member_admissionDate,
    };
  }

  factory gymmembers.fromMap(Map<String, dynamic> map) {
    return gymmembers(
      member_id: map['member_id'] as String,
      member_name: map['member_name'] as String,
      member_phone: map['member_phone'] as String,
      member_admissionDate: map['member_admissionDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory gymmembers.fromJson(String source) => gymmembers.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant gymmembers other) {
    if (identical(this, other)) return true;
  
    return 
      other.member_id == member_id &&
      other.member_name == member_name &&
      other.member_phone == member_phone &&
      other.member_admissionDate == member_admissionDate;
  }

  @override
  int get hashCode {
    return member_id.hashCode ^
      member_name.hashCode ^
      member_phone.hashCode ^
      member_admissionDate.hashCode;
  }
}
