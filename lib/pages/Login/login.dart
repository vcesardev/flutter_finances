import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_finances/models/user.dart';
import 'package:flutter_finances/provider/entries_provider.dart';
import 'package:flutter_finances/provider/user_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final UserModel user = UserModel(
        email: userCredential.user?.email ?? '',
        name: userCredential.user?.displayName ?? '',
        id: userCredential.user?.uid ?? '',
        photoUrl: userCredential.user?.photoURL ?? '',
      );

      Provider.of<UserProvider>(context, listen: false).setUser(user);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login feito com sucesso!"),
          duration: Duration(seconds: 3),
          backgroundColor: CustomColors().blue,
        ),
      );
    } catch (e) {
      print('Erro no login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Houve um erro ao tentar fazer o login!"),
          duration: Duration(seconds: 3),
          backgroundColor: CustomColors().red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors().blue,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: CustomColors().blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animations/finances-animation.json',
                      height: 250, width: 250),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: "go",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'finances',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: const Text(
                      "Controle suas finanças de forma muito simples",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.white),
                    onPressed: () {
                      signInWithGoogle(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/icons/google-icon.svg',
                            width: 24, height: 24),
                        const SizedBox(width: 8),
                        Container(
                          width: 1,
                          height: 24,
                          color: CustomColors().background,
                        ),
                        const SizedBox(width: 30),
                        Text(
                          "Entrar com Google",
                          style: TextStyle(
                              color: CustomColors().title, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
