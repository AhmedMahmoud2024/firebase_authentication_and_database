import 'package:firebase_authentication_and_database/services/firebase_auth_service.dart';
import 'package:firebase_authentication_and_database/services/firestore_service.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
 final TextEditingController _nameController= TextEditingController();
  final TextEditingController _emailController= TextEditingController();
   final TextEditingController _passwordController= TextEditingController();
  final _authService=FirebaseAuthService();
  final _firestoreServices=FirestoreService();
  bool _isLoading=false;

void signUp()async{
if(_nameController.text.isEmpty || _emailController.text.isEmpty || _passwordController.text.isEmpty){
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Please fill in all fields'),)
  );
    return;
}
setState(() => _isLoading=true,);
try{
final credrntial= await _authService.singUpWithEmailAndPassword(
    _emailController.text.trim(),
     _passwordController.text.trim()
     );
     if(credrntial.user !=null){
      _firestoreServices.saveUserData(
        uid: credrntial.user!.uid,
         name: _nameController.text.trim(),
          email: _emailController.text.trim()
          );
          if(mounted){
            Navigator.pushReplacement(
              context,
              //Homepage
              MaterialPageRoute(builder: (context) =>  Container())
            );
          }
     }
}catch(e){
   if(mounted){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.toString().replaceAll('Exception: ', '')),)
    );
   }
}finally{
  if(mounted){
    setState(() => _isLoading=false,);
  }
}
}

@override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}