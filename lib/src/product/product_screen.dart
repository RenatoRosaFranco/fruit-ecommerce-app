// frozen_string_literal: true

import 'package:flutter/material.dart';
import 'package:untitled4/src/config/custom_colors.dart';
import 'package:untitled4/src/models/item_model.dart';
import 'package:untitled4/src/pages/common_widgets/quantity_widget.dart';
import 'package:untitled4/src/services/utils_services.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key, required this.item}) : super(key: key);

  final ItemModel item;
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          // Conteúdo
          Column(
            children: [
              Expanded(
                child:
                    Hero(tag: item.imageUrl, child: Image.asset(item.imageUrl)),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade600,
                            offset: const Offset(0, 2))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const QuantityWidget()
                        ],
                      ),

                      // Price
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customSwatchColor),
                      ),

                      // Description
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                              child: Text(
                            item.description,
                            style: const TextStyle(height: 1.5),
                          )),
                        ),
                      ),

                      // Button
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          label: const Text('Adicionar ao Carrinho',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          icon: const Icon(Icons.shopping_cart_outlined,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),

          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios))),
          ),
        ],
      ),
    );
  }
}
