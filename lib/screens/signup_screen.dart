import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:observateur/ressources/auth_method.dart';
import 'package:observateur/screens/login_screen.dart';

import 'package:observateur/utils/colors.dart';
import 'package:observateur/utils/utils.dart';
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
  Uint8List? _image;
  bool _isLoading = false;

  @override //créer un state object qui ne sera jamais build plus tard
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!,
    );

    // ignore: avoid_print
    print(res);
        setState(() {
      _isLoading = false;
    });

    if (res != "success") {
      showSnackBar(res, context);
    }  
  
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    // image
                    Image.asset("image/observateur.jpg"),
                    const SizedBox(
                      height: 64,
                    ),
                    //circular widget pour accepter ete montrer le file selector pour l'avatar
                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : const CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                    "https://soccerpointeclaire.com/wp-content/uploads/2021/06/default-profile-pic-e1513291410505.jpg"),
                              ),
                        Positioned(
                          bottom: 0,
                          left: 80,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: selectImage,
                              icon: const Icon(Icons.add_a_photo),
                              color: Colors.red,
                            ),
                          ),
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
                    InkWell(
                      onTap: signUpUser,
                      child:  Container(
                        child: _isLoading ? Center(child: CircularProgressIndicator(),) : Text(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          color: redColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
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
                                    builder: (context) => const LoginScreen()));
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
        ),
      ),
    );
  }
}
