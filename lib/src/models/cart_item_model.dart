// frozen_string_literal: true

import 'package:untitled4/src/models/item_model.dart';

class CartItemModel {
  ItemModel item;
  int quantity;

  CartItemModel({
    required this.item,
    required this.quantity
  });
}