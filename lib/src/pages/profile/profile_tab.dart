// frozen_string_literal: true

import 'package:flutter/material.dart';
import 'package:untitled4/src/config/app_data.dart' as app_data;
import 'package:untitled4/src/pages/common_widgets/custom_text_field.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
              icon: Icons.email,
              label: 'E-mail',
              isReadOnly: true,
              initialValue: app_data.user.email),
          CustomTextField(
              icon: Icons.person,
              label: 'Nome',
              isReadOnly: true,
              initialValue: app_data.user.name),
          CustomTextField(
              icon: Icons.phone,
              label: 'Celular',
              isReadOnly: true,
              initialValue: app_data.user.phone),
          CustomTextField(
              icon: Icons.file_copy,
              label: 'CPF',
              isSecret: true,
              isReadOnly: true,
              initialValue: app_data.user.cpf),

          // Button
          SizedBox(
              height: 50,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.green
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  ),
                  onPressed: () {},
                  child: const Text('Atualizar senha')))
        ],
      ),
    );
  }
}
