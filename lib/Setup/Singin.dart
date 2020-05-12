


import 'dart:developer';

import 'package:asynproject/Pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginpageState createState()=>new _LoginpageState();
  }
  
  class _LoginpageState  extends State<LoginPage> {
    String _email,_password;
     final GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
     


    return Scaffold(
      appBar:AppBar(
        title: Text("Sign in"),
      ),
      body: Form(
        key: _formkey,
        child: Column(
        children:<Widget>[
           TextFormField(
             validator:(input){
               if(input.isEmpty){
                 return 'Please Type an Email';
               }
             
             },
             onSaved:(input)=>_email = input,
             decoration: InputDecoration(
               labelText:'Email'
               ),
           ),
         TextFormField(
          validator:(input){
            if(input.length<0){
              return 'Please Provide correct a Password';
            }
            
          },
          onSaved:(input)=>_password=input,
          decoration:InputDecoration(
            labelText:'Password'
             ),
             obscureText: true,
         ),
         RaisedButton(
            
            onPressed: ()=> signIn(),
       
            child:Text('Sign in'),
           
                    ),
        ]
      ),
      ),
    );
  }

  Future<void> signIn() async {
    
    
  final formState=_formkey.currentState;
   if(formState.validate()){
     formState.save();
     try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(email:_email , password:_password );
        log("ff");
         Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
     }catch(e){
           print(e.message);
     }
   }



}




}

