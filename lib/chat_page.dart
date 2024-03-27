import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pract1/widgets/chat_bubble.dart';
import 'package:pract1/widgets/chat_input.dart';

import 'model/chat_message_entity.dart';
class ChatPage extends StatefulWidget {
  //final String username;   // does not need with routes
 // const ChatPage( {Key? key,required this.username}):  super(key:key);
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // initial state of messages
  List<ChatMessageEntity> _message=[];

   _loadInitalMessages() async{
     //final response =await rootBundle.loadString('assets/mock_messages.json');
      // aboove line used to load json file  and use 'async' with function name

     rootBundle.loadString('assets/mock_messages.json').then((response){
       final List<dynamic> decodedList= jsonDecode(response) as List;
       final List<ChatMessageEntity> _chatMessages = decodedList.map((listItem){
         return ChatMessageEntity.fromJson(listItem);
       }).toList();
       print(response);
       print(_chatMessages.length);
       // final state of messages
       setState(() {
         _message=_chatMessages;
       });
     }).then((_){
       print('done');
     });
     print('something');

   }

   onMessageSent(ChatMessageEntity entity){
     _message.add(entity);
     setState(() {});
   }

   @override
  void initState() {
   _loadInitalMessages();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final username=ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(" Hi $username"),
        actions: [
          IconButton(onPressed: (){
            print("icon presed");
            //Navigator.maybePop(context); // pushReplacementNamed can be used
            Navigator.popAndPushNamed(context, '/'); //here '/' is === home widget (loginPage)
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _message.length,
              itemBuilder: (context,index){
             return chatBubble(
                 alignment:_message[index].author.userName=="Naveen72"
                     ?Alignment.centerRight: Alignment.centerLeft,
                 entity: _message[index]
             );

          },),

          ),
          ChatInput( onSubmit:  onMessageSent,),
        ],

      ),
    );
  }
}
