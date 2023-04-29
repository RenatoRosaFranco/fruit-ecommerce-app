// frozen_string_literal: true

import 'package:flutter/material.dart';
import 'package:untitled4/src/config/app_data.dart' as app_data;
import 'package:untitled4/src/pages/common_widgets/custom_text_field.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
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
                      side: const BorderSide(color: Colors.green),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onPressed: updatePassword,
                  child: const Text('Atualizar senha')))
        ],
      ),
    );
  }

  Future<bool?> updatePassword() async {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 12),
                            child: Text(
                              'Atualização de senha',
                              style:
                                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      CustomTextField(
                          icon: Icons.lock,
                          label: 'Senha atual',
                          isSecret: true,
                          isReadOnly: true,
                          initialValue: app_data.user.password),
                      const CustomTextField(
                          icon: Icons.lock_outline, label: 'Nova Senha', isSecret: true),
                      const CustomTextField(
                          icon: Icons.lock_outline, label: 'Confirmar nova senha', isSecret: true),

                      // Button
                      SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              )
                            ),
                              onPressed: () {}, child: const Text('Atualizar')))
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
