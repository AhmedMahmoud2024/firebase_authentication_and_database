import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_authentication_and_database/screens/login_screen.dart';
import 'package:firebase_authentication_and_database/services/firebase_auth_service.dart';
import 'package:firebase_authentication_and_database/services/firestore_service.dart';
import 'package:firebase_authentication_and_database/widgets/profile_info_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final authService=FirebaseAuthService();
   final firestoreService=FirestoreService();
   final currentUser= authService.currentUser;
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: ()async{
          await authService.signOut();
          if(context.mounted){
            Navigator.pushReplacement(
              context,
             MaterialPageRoute(
              builder: (_)=>const LoginScreen()
              )
             );
          }
          },
           icon: const Icon(Icons.logout)
           )
        ],
      ),
      body: currentUser==null ? const Center(
        child: Text('User not found'),
      ):FutureBuilder<DocumentSnapshot<Map<String,dynamic>>>(
        future: firestoreService.getUserData(currentUser.uid),
         builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(color: Colors.deepPurple,),
            );
          }
          if(snapshot.hasError){
            return Center(child: Text('Erorr fetching data'),);
          }
          if(snapshot.hasData && snapshot.data!.exists){
            final  data = snapshot.data!.data()!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.deepPurple,
                    child: Icon(Icons.person,size: 50,color: Colors.white
                    ,),
                  ),
                  const SizedBox(height: 32,),
                  ProfileInfoTile(
                    lable: 'Full Name',
                     value: data['name'] ?? 'N/A',
                      icon: Icons.person_outlined
                  ),
                    ProfileInfoTile(
                    lable: 'Email Address',
                     value: data['email'] ?? 'N/A',
                      icon: Icons.email_outlined
                  ),
                    ProfileInfoTile(
                    lable: 'Firebase Uid',
                     value: currentUser.uid,
                      icon: Icons.vpn_key_outlined
                  ),
                ],
              ),
            );
          }
         return const Center(
          child: Text('No Data stored in firestore'),
         );
         }
      
         )
      ,
    );
  }
}