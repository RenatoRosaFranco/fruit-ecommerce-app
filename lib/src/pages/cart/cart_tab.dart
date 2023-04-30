// frozen_string_literal: true

import 'package:flutter/material.dart';
import 'package:untitled4/src/config/custom_colors.dart';
import 'package:untitled4/src/services/utils_services.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(child: Placeholder()),
          const SizedBox(height: 20),
          Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3,
                        spreadRadius: 2)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Total Geral', style: TextStyle(fontSize: 12)),
                  Text(
                    utilsServices.priceToCurrency(50.00),
                    style: TextStyle(
                        fontSize: 23,
                        color: CustomColors.customSwatchColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: CustomColors.customSwatchColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        onPressed: () {},
                        child: const Text(
                          'Concluir pedido.',
                          style: TextStyle(fontSize: 18),
                        )),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
