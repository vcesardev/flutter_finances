import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  SvgPicture.asset('assets/icons/coins-icon.svg',
                      width: 36, height: 36),
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
                      // Ação do botão
                    },
                    child: Row(
                      mainAxisSize:
                          MainAxisSize.min, // Ajusta o tamanho ao conteúdo
                      children: [
                        SvgPicture.asset('assets/icons/google-icon.svg',
                            width: 24, height: 24), // Ícone
                        const SizedBox(
                            width: 8), // Espaçamento entre o ícone e o traço
                        Container(
                          width: 1, // Largura do traço vertical
                          height: 24, // Altura do traço vertical
                          color: CustomColors().background, // Cor do traço
                        ),
                        const SizedBox(
                            width: 30), // Espaçamento entre o traço e o texto
                        Text(
                          "Entrar com Google",
                          style: TextStyle(
                              color: CustomColors().title, fontSize: 16),
                        ), // Texto
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
