import 'package:chat/pages/log_in.dart';
import 'package:chat/services/auth_services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
        body:
    Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome to the Log In Page!',style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent
            ),),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                if (value==null || value.isEmpty) {
                  return 'Please enter your email';
                }else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email';
                }else
                 // ignore: curly_braces_in_flow_control_structures
                 return null;
              },
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email'),
),
            SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value==null || value.isEmpty) {
                  return 'Please enter your password';
                }else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }else
                 // ignore: curly_braces_in_flow_control_structures
                 return null;
              },
              controller: passwordController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password'), 
              obscureText: true), 
              
            SizedBox(height: 20),

            TextFormField(
              validator: (value) {
                if (value==null || value.isEmpty) {
                  return 'Please confirm your password';
                }else if (value != passwordController.text) {
                  return 'Passwords do not match';
                }else
                 // ignore: curly_braces_in_flow_control_structures
                 return null;
              },
              controller: confirmPasswordController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Confirm Password'), 
              obscureText: true),


            SizedBox(height: 20),

            RichText(text: TextSpan(text: 'Already have an account? ', style: TextStyle(color: Colors.black), children: [
              TextSpan(
                text: 'Log In',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()..onTap = () {
                  // Navigate to Sign Up page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LogInPage()));
                },
              ),
            ])),

            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(strokeAlign: 4,
                      width: 2,
                      color: Colors.blue)
                    )
                  ),
                  onPressed: ()async{
                if (formKey.currentState!.validate()){
                  try{
                    final signup = await firebaseServices.register(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim());
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                        Text('Register Successfully !!',
                          style: TextStyle(color: Colors.green),
                        ),duration: Duration(seconds: 1),));
                  return signup;
                  }catch(e){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('{Form Not Validated}',style: TextStyle(color: Colors.red),),duration: Duration(seconds: 1),));

                  }
                }

              }, child: Text('Sign up')),
            )
          ],
              ),
        ),
      )
      )
      );
  }
}