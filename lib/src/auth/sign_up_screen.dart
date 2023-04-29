import 'package:flutter/material.dart';
import 'package:untitled4/src/config/custom_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text('Cadastro', style: TextStyle(
                color: Colors.white,
                fontSize: 35
              ),),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 40
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(45))
            ),
          ),
        ],
      ),
    );
  }
}
