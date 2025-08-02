import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices{

  Future register({required String email,required String password})async
  {
    try{
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password);
      return userCredential;
    }on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        return('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return('The account already exists for that email.');
      }
    }
    catch(e)
    {e.toString();}

  }


  Future login({required String email, required String password})async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim().toLowerCase(),
          password: password
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return('Wrong password provided for that user.');
      }else{
        return ('Authentication error');
      }
    }
  }

  Future sendPasswordResetEmail({required String email})async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim().toLowerCase());

    }
    catch(e){
      e.toString();
    }
  }




}