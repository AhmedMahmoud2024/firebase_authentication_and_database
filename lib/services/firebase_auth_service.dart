import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
   User? get currentUser=>_auth.currentUser;

  Future<UserCredential> singUpWithEmailAndPassword(
    String email,
    String password
  )async{
  try{
     return await _auth.createUserWithEmailAndPassword(
      email: email,
       password: password
       );
  }on FirebaseAuthException catch(e){
 throw Exception(_handleAuthError(e.code));
  }catch(e){
    throw Exception('Unexpected Error Try Aain');
  }
   }


  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password
  )async{
  try{
     return await _auth.signInWithEmailAndPassword(
      email: email,
       password: password
       );
  }on FirebaseAuthException catch(e){
 throw Exception(_handleAuthError(e.code));
  }catch(e){
    throw Exception('Unexpected Error Try Aain');
  }
   }
  Future<void> signOut()async{
 await _auth.signOut();
   }

  String _handleAuthError(String errorCode){
  switch(errorCode){
   case 'weak-password':return 'password is very weak';
   case 'email-already-in-use' : return 'email is already in use';
   case 'user-not-found': return 'user not found';
   case 'wrong-password': return 'incorrect password';
   default : return 'authentication error occured $errorCode';
}
   }
}