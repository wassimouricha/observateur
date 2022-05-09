import 'package:flutter/material.dart';
import 'package:observateur/ressources/auth_method.dart';
import 'package:observateur/screens/home_screen.dart';
import 'package:observateur/screens/signup_screen.dart';
import 'package:observateur/utils/colors.dart';
import 'package:observateur/utils/utils.dart';
import 'package:observateur/widget/text_field_rename.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override //créer un state object qui ne sera jamais build plus tard
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);

    // ignore: avoid_print
    print(res);
    setState(() {
      _isLoading = false;
    });

    if (res == "success") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
      //
    } else {
      //snackbar
      showSnackBar(res, context);
    }
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
            //bouton login
            InkWell(
              onTap: loginUser,
              child: Container(
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        "Connectez-vous",
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
                    "Pas de compte ?",
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
                            builder: (context) => const SignupScreen()));
                  },
                  child: Container(
                    child: Text(
                      "Inscrivez-vous !",
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
