import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db=FirebaseFirestore.instance;

  Future<void> saveUserData(
    {
      required String uid,
      required String name,
      required String email
    }
  )async{
 try{
   await _db.collection('users').doc(uid).set({
    'name':name,
    'email':email,
    'createdAt':FieldValue.serverTimestamp()
   });
 }catch(e){
  throw Exception('Error in saving data in firestore');
 }
  }

Future<DocumentSnapshot<Map<String,dynamic>>> getUserData(String uid)async{
try{
 return await _db.collection('users').doc(uid).get();
}catch(e){
  throw Exception('Error in fetching data from firestore: $e');
}
}
}