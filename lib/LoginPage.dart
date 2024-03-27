import 'package:flutter/material.dart';
import 'package:pract1/chat_page.dart';
import 'package:pract1/utils/spaces.dart';
import 'package:pract1/utils/textfield_styles.dart';
import 'package:pract1/widgets/login_text_field.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey= GlobalKey<FormState>();
  final _mainUrl= 'https://stackoverflow.com/';
  final userNameController= TextEditingController();
    final passwords= TextEditingController();
  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      // if (userNameController.text.length < 5) {
      //   //throw error
      // }
      print(userNameController.text);
      print('login successfull');
      print(passwords.text);

      Navigator.pushReplacementNamed(
        context, '/chat',arguments:'${userNameController.text}'
      );
      // Navigator.push(
      //   context, MaterialPageRoute( builder: (context)=> ChatPage(
      //   username: userNameController.text,))
      // );
    }else {
      print('not succesful ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //add the text and image from design
      body: 
      SingleChildScrollView(
        child: Center(

               
          child: Padding(

            padding: const EdgeInsets.all(24.0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 
                Text('Let\'s sign you in',

                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold, letterSpacing: 0.5
                ),),
                Center(
                  child:
                  Text('Welcome back \n You\'ve been missed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  ),

                ),
                Image.network('https://picsum.photos/250?image=9', height:200),

                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      LoginTextField(
                        hintText: "enter username",
                        controller: userNameController,
                        validator: (value){
                          if(value!= null && value.isNotEmpty && value.length< 5){
                            return "your user name should be more than 5 characters";

                          }else if(value!= null && value.isEmpty){
                             return 'please type user name';
                          }
                          return null;
                        },


                      ),

                      verticalSpacing(24),
                      LoginTextField(
                        hasAsterisks: true,
                        controller: passwords,
                        hintText: 'Enter password',
                      ),
                      verticalSpacing(24),
                    ],
                  ),
                ),

                ElevatedButton(onPressed: (){
                  loginUser(context);
                },
                    child: Text("Login ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),)),

               InkWell( //also have gestureDetector widget which does same except splashColor
                 splashColor: Colors.red,
                 onTap: () async{
                   //to do: Navigate to browser
                   print('link clicked');
                   if(!await launchUrl(_mainUrl as Uri)){
                     throw 'could not launch ';
                   }
                 },
                 onDoubleTap: (){
                   print('double taped');
                 },
                 onLongPress: (){
                   print('longed pressed');
                 },
                 child: Column(
                   children: [
                     Text("find us on"),
                     Text(_mainUrl),
                   ],
                 ),
               ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    SocialMediaButton.twitter(
                        size: 26, color: Colors.blue,
                        url:"https://twitter.com/"),
                    SocialMediaButton.linkedin(url:"https://linkedin.com/")
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
