// frozen_string_literal: true

import 'package:flutter/material.dart';
import 'package:untitled4/src/config/custom_colors.dart';
import 'package:untitled4/src/models/item_model.dart';
import 'package:untitled4/src/pages/product/product_screen.dart';
import 'package:untitled4/src/services/utils_services.dart';

class ItemTile extends StatelessWidget {
  ItemTile({Key? key, required this.item}) : super(key: key);

  final ItemModel item;
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Conteudo
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ProductScreen(item: item);
            }));
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade400,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Image
                  Expanded(
                      child: Hero(
                          tag: item.imageUrl,
                          child: Image.asset(item.imageUrl))),

                  // Name
                  Text(
                    item.itemName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  // Price
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: CustomColors.customSwatchColor),
                      ),

                      // Unit
                      Text(
                        '/${item.unit}',
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.customSwatchColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(20))),
              height: 40,
              width: 35,
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
        )
      ],
    );
  }
}
