// frozen_string_literal: true

import 'package:flutter/material.dart';
import 'package:untitled4/src/config/custom_colors.dart';
import 'package:untitled4/src/models/cart_item_model.dart';
import 'package:untitled4/src/pages/common_widgets/quantity_widget.dart';
import 'package:untitled4/src/services/utils_services.dart';

class CartTile extends StatelessWidget {
  CartTile({Key? key, required this.cartItem}) : super(key: key);

  final CartItemModel cartItem;
  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: ListTile(
        // Imagem
        leading: Image.asset(cartItem.item.imageUrl, width: 60, height: 60),

        title: Text(cartItem.item.itemName,
            style: const TextStyle(fontWeight: FontWeight.w500)),
        // Total
        subtitle: Text(
          utilsServices.priceToCurrency(cartItem.totalPrice()),
          style: TextStyle(
              color: CustomColors.customSwatchColor,
              fontWeight: FontWeight.bold),
        ),
        // Quantidade
        trailing: QuantityWidget(
          result: (quantity) {},
          suffixText: cartItem.item.unit,
          value: cartItem.quantity,
        ),
      ),
    );
  }
}
