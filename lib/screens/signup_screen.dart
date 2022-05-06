import 'package:flutter/material.dart';
import 'package:observateur/screens/login_screen.dart';

import 'package:observateur/utils/colors.dart';
import 'package:observateur/widget/text_field_rename.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override //créer un state object qui ne sera jamais build plus tard
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            // image
            Image.asset("image/observateur.jpg"),
            const SizedBox(
              height: 64,
            ),  
          //circular widget pour accepter ete montrer le file selector pour l'avatar
          Stack(
            children: [
              CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage("https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),

              ),
            ],
          ),
             const SizedBox(
              height: 24,
            ),  
             //text field input pour le nom d'utilisateur
              TextFieldInput(
              hinText: "Entrez votre Nom d'utilisateur ",
              textInputType: TextInputType.emailAddress,
              textEditingController: _usernameController,
            ),
    
            const SizedBox(
              height: 24,
            ),
          
            //Text field input pour l'email
            TextFieldInput(
              hinText: "Entrez votre email ",
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
            //text field input pour le mot de passe
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hinText: "Entrez votre Mot de passe ",
              textInputType: TextInputType.text,
              textEditingController: _passwordController,
              isPass: true,
            ),
               const SizedBox(
              height: 24,
            ),
        
                //text field input pour la bio
              TextFieldInput(
              hinText: "Entrez votre Bio ",
              textInputType: TextInputType.emailAddress,
              textEditingController: _bioController,
            ),
    
            const SizedBox(
              height: 24,
            ),
        
            //bouton login
            Container(
              child: Text(
                "Inscrivez-vous",
                style: GoogleFonts.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                color: redColor,
              ),
            ),
            const SizedBox(
              height: 12,
            ),

            Flexible(
              child: Container(),
              flex: 2,
            ),
            //transition vers signing up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "déjà un compte ?",
                    style: GoogleFonts.poppins(),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen()));
                  },
                  child: Container(
                    child: Text(
                      "Connectez-vous !",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, color: redColor),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
