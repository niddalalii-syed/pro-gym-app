// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final int point;
  final String rank;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.point,
    required this.rank,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    int? point,
    String? rank,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      point: point ?? this.point,
      rank: rank ?? this.rank, 
      profileImage: '',
    );
  }

  

  factory User.initializeUser(){
    return User(
      id: '',
      name: '',
      email: '',
      point: -1,
      rank: '', 
      profileImage: '',
    );
  }
  factory User.fromDoc(DocumentSnapshot userDoc){
    final userData =userDoc.data() as Map<String,dynamic>?;

    return User(id: userDoc.id,
    name: userData!['name'],
    email: userData['email'],
    profileImage: userData['profileImage'],
    point: userData['point'],
    rank: userData['rank'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'point': point,
      'rank': rank,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      point: map['point'] as int,
      rank: map['rank'] as String, profileImage: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, point: $point, rank: $rank)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.point == point &&
      other.rank == rank;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      point.hashCode ^
      rank.hashCode;
  }
}
