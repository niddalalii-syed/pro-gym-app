// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CustomError {
  final String code;
  final String message;
  final String plugin;

  CustomError({
    this.code ='', 
    this.message='', 
    this.plugin='',
});



  CustomError copyWith({
    String? code,
    String? message,
    String? plugin,
  }) {
    return CustomError(
      code: code ?? this.code,
      message: message ?? this.message,
      plugin: plugin ?? this.plugin,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'message': message,
      'plugin': plugin,
    };
  }

  factory CustomError.fromMap(Map<String, dynamic> map) {
    return CustomError(
      code: map['code'] as String,
      message: map['message'] as String,
      plugin: map['plugin'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomError.fromJson(String source) => CustomError.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CustomError(code: $code, message: $message, plugin: $plugin)';

  @override
  bool operator ==(covariant CustomError other) {
    if (identical(this, other)) return true;
  
    return 
      other.code == code &&
      other.message == message &&
      other.plugin == plugin;
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode ^ plugin.hashCode;
}
