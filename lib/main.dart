
import 'package:chat/pages/log_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainApp());
  }
}



class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  splashScreen() async {
    await Future.delayed(Duration(seconds: 2));
    {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogInPage()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    splashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(

              radius: 90,
              backgroundColor: Colors.white,
              child: Icon(Icons.person_2,size: 100,color: Colors.blue,),
            ),
            SizedBox(height: 90,),
            Text('WelCome Back !',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.white
            ),),
            SizedBox(height: 20),
            
          ],
        ),
      )
    );
  }
}
