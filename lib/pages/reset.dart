import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_services.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  FirebaseServices firebaseServices = FirebaseServices();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application",
          style: TextStyle(
            fontSize: 24,
            letterSpacing: 1.7,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 24,
      vertical: 32),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email,color: Colors.grey,),
                  labelText: "Email",
                  hintText: "Enter your email",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 32,),
              
              SizedBox(
                width: MediaQuery.of(context).size.width*.9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(strokeAlign: 4,
                                width: 2,
                                color: Colors.blue)
                        )
                    ),
                    onPressed: ()async{
                      try{
                        await firebaseServices.sendPasswordResetEmail(email: emailController.text.trim().toLowerCase());

                      }catch(e){
                        e.toString();
                      }
                    },
                    child: Text("Reset Password")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
