import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text ;
  final VoidCallback  onPressed;
  final bool isLoading;
  const CustomButton({
    super.key,
     required this.text,
      required this.onPressed,
        this.isLoading=false
       });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:double.infinity,
      height:52,
      child: ElevatedButton(
        style:ElevatedButton.styleFrom(
          backgroundColor:Colors.purple,
          foregroundColor:Colors.white,
          shape:RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(12)
          )
        ),
        onPressed:isLoading ?null :onPressed,
        child:isLoading? SizedBox(height: 24,width: 24,child: CircularProgressIndicator(
          color: Colors.white,
        strokeWidth:2.5,),)
        :Text(text,
        style:TextStyle(
          fontSize:16,
          fontWeight:FontWeight.bold
        )
        )
      )
    );
  }
}