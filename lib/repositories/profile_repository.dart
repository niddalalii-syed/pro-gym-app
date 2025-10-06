import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro_gym/Constants/db_constants.dart';
import 'package:pro_gym/Models/error_model.dart';
import 'package:pro_gym/Models/user_model.dart';
import 'package:pro_gym/Models/user_model.dart';

class ProfileRepository{
  final FirebaseFirestore firebaseFirestore;

  ProfileRepository({required this.firebaseFirestore});


  Future<User> getProfile({required String uid})async{
    try{
      final DocumentSnapshot userDoc=await userRef.doc(uid).get();
      if(userDoc.exists){
        final currentUser=User.fromDoc(userDoc);
        return currentUser;
      }
      throw 'User not found';
    }on FirebaseException catch(e){
      throw CustomError(
        code:e.code,
        message: e.message!,
        plugin: e.plugin
      );
    }catch(e){
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error'
      );
    }
  }
}