import 'package:flutter/material.dart';
import 'package:pract1/LoginPage.dart';
import 'package:pract1/chat_page.dart';
import 'package:pract1/counter.dart';
import 'package:pract1/utils/brand_color.dart';

void main() {
  runApp(ChatApp());
}
class ChatApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter chat app",
      theme: ThemeData(
        //  primarySwatch: BrandColor.primaryColor,
          primarySwatch: Colors.purple,

          appBarTheme: AppBarTheme(backgroundColor: Colors.blue, foregroundColor: Colors.brown)),
        // home: CounterStateful(buttonColor: Colors.blue,),
      home: LoginPage(), // === '/'
      routes: {
        //'/chat' : (contex)=> ChatPage(username: "Naveen",) //thsi is hardcoded value
        '/chat': (context)=> ChatPage()
      },
    );
  }

}
