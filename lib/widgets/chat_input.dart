import 'package:flutter/material.dart';
import 'package:pract1/model/chat_message_entity.dart';
class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSubmit;
   ChatInput({Key ? key, required this.onSubmit}): super(key: key);

final chatMessageController= TextEditingController();
void onSendButtonPressed(){
  print('chatMessage: ${chatMessageController.text}');
  final newChatMessage= ChatMessageEntity(
      text: chatMessageController.text,
      id: 'i2342', createdAt: DateTime.now().millisecondsSinceEpoch,
      author: Author(userName: 'Naveen72'));
  onSubmit(newChatMessage);
}
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100,
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.add, color: Colors.white,)),
          
          Expanded(child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            minLines:1,
            controller: chatMessageController,
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
            hintText:"type your message",
            hintStyle: TextStyle(color: Colors.blueGrey),
            border: InputBorder.none),


          )),
          IconButton(
              onPressed: onSendButtonPressed,
              icon: Icon(Icons.send, color: Colors.white,)),

        ],
      ),
      decoration:  BoxDecoration(
          color: Colors.black,

          borderRadius: BorderRadius.vertical(top:Radius.circular(20))
      ),

    );
  }
}
