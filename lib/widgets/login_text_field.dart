import 'package:flutter/material.dart';

import '../utils/textfield_styles.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool hasAsterisks;
  const LoginTextField({Key? key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.hasAsterisks=false,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hasAsterisks,
      controller: controller,
      validator: (value){
       if(validator !=null){
        return  validator!(value);
       }
      },

      decoration: InputDecoration(
        hintText: 'Add username',
        hintStyle: ThemeTextStyle.loginTextFieldStyle,
        border: OutlineInputBorder(),
      ),
    );
  }
}
