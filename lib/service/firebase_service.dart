 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_gym/Models/gym_members.dart';

class FirestoreService {
  final CollectionReference _membersCollection =
  FirebaseFirestore.instance.collection('gym_members');

  Stream<List<gymmembers>> getMembers() {
    return _membersCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return gymmembers(
          member_id: doc.id, 
          member_name: data['name'], 
          member_phone: data['phonenumber'], 
          member_admissionDate: data['add_date'].toString(),
        );
      }).toList();
    });
  }

  Future<void> addMembers(gymmembers reg_memebers) {
    return _membersCollection.add({
      'name':reg_memebers.member_name,
      'phonenumber':reg_memebers.member_phone,
      'add_date':reg_memebers.member_admissionDate,
    });
  }

  Future<void> updateMembers(gymmembers reg_memebers) {
    return _membersCollection.doc(reg_memebers.member_id).update({
      'name':reg_memebers.member_name,
      'phonenumber':reg_memebers.member_phone,
      'add_date':reg_memebers.member_admissionDate,
    });
  }

  Future<void> deleteMembers(String membersId) {
    return _membersCollection.doc(membersId).delete();
  }
}