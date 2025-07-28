import 'package:chat/pages/sign_up.dart';
import 'package:chat/services/auth_services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseServices firebaseServices = FirebaseServices();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
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

            RichText(text: TextSpan(text: 'Don\'t have an account? ', style: TextStyle(color: Colors.black), children: [
              TextSpan(
                text: 'Sign Up',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()..onTap = () {
                  // Navigate to Sign Up page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                },
              ),
            ])),

            SizedBox(height: 20),
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
                if (formKey.currentState!.validate()){
                  try{
                    final login = await firebaseServices.login(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());

                        await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Successfully LogIn',
                        style: TextStyle(color: Colors.green),),
                      duration: Duration(seconds: 1),));
                  }catch(e)
                  {e.toString();}
                }else{
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                     content: Text('Some Error Occurred',
                       style: TextStyle(color: Colors.red),),
                     duration: Duration(seconds: 1),));
                }
              }, child: Text('Log In',style: TextStyle(

              ))),
            )
          ],
              ),
        ),
      )));
  }
}
