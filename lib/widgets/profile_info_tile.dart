import 'package:flutter/material.dart';

class ProfileInfoTile extends StatelessWidget {
  final String lable;
  final String value;
  final IconData icon;
  const ProfileInfoTile({
    super.key,
     required this.lable,
      required this.value,
       required this.icon
       });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:const EdgeInsets.symmetric(vertical: 8),
      shape:RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(12),
      ),
       elevation:1,
       child:ListTile(
        leading: CircleAvatar(
          backgroundColor:Colors.deepPurple.withOpacity(0.1),
          child: Icon(icon,color:Colors.deepPurple),
        ),
        title: Text(
          lable,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500
          ),
        ),
        subtitle: Padding(padding: EdgeInsets.only(top:4.0),
        child: Text(
          value,
         style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87
         ),
        ),
        ),
       )
    );
  }
}