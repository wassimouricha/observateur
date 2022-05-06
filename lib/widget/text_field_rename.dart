import 'package:flutter/material.dart';

//mon widget d'inpuut
class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;  //pour verifier si la valeur sera un mot de passe ou non
  final String hinText;
  final TextInputType textInputType;
  const TextFieldInput({ Key? key , 
  required this.textEditingController, 
  required this.hinText, 
   this.isPass = false, 
  required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(borderSide: Divider.createBorderSide(context) );
    return TextField(
      
      controller: textEditingController,
      decoration:
      InputDecoration(
        
        hintText: hinText ,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
        
        
      ),
      keyboardType: textInputType,
      obscureText: isPass,
      
    );
  }
}