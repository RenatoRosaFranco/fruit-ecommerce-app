import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 40
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(45)
                ),
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)
                      )
                    ),
                  ),
                  TextFormField()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
