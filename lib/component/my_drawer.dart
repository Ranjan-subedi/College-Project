import 'package:flutter/material.dart';

import '../pages/setting.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(Icons.account_circle,size: 48,color: Colors.blue,),),

            ListTile(
              onTap: (){
                Navigator.pop(context);
              },
              leading:Icon(Icons.home),
            title: Text('Home'),),


            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage(),));
              },
              leading:Icon(Icons.settings),
              title: Text('Setting'),),

            Expanded(child: SizedBox()),

            ListTile(leading:Icon(Icons.login_outlined),
              title: Text('Logout'),),

          ],
        ),
      ),
    );


  }
}
