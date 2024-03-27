import 'package:flutter/material.dart';

import '../model/chat_message_entity.dart';
class chatBubble extends StatelessWidget {
  final ChatMessageEntity entity;

  final Alignment alignment;
  const chatBubble({Key? key, required this.alignment, required this.entity}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: alignment,
      child: Container(
        constraints:
           BoxConstraints(maxWidth:MediaQuery.of(context).size.width* 0.5 ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Text('${entity.text}', style: TextStyle(fontSize: 20,
                color: Colors.white),),
           // Image.network('https://picsum.photos/250?image=9', height: 100, width: 100 ,),
            if(entity.imageUrl!=null)
              Image.network('${entity.imageUrl}', height: 200,)


          ],
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))
        ),
      ),
    );
  }
}
