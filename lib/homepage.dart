import 'package:chat/component/my_drawer.dart';
import 'package:chat/services/auth_services.dart';
import 'package:chat/services/chat/chat_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ChatServices chatServices = ChatServices();
  final FirebaseServices firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('App'),
      actions: [
        IconButton(onPressed: (){
          FirebaseAuth.instance.signOut();
        }, icon: Icon(Icons.logout)),
        Column(
          children: [
            Icon(Icons.person),
            Text('${FirebaseAuth.instance.currentUser!.email}')
          ],
        )

      ],
      ),
      drawer: MyDrawer(),

      body: StreamBuilder(stream: chatServices.getUsersStream(),
        builder: (context, snapshot) {

        //Error
        if(snapshot.hasError){
          return Text("Has Error");
        }

        //Loading
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text("Loading");
        }

        //reurn List View
          return ListView(children : snapshot.data!.map((e) => buildUSerItemList,).toList());
      },),

      floatingActionButton: FloatingActionButton(onPressed: ()async{
        await FirebaseAuth.instance.signOut();
      }),
    );

    Widget buildUSerItemList(Map<String,dynamic> userdata , BuildContext context){
      return UserTile();
    }
  }
}
