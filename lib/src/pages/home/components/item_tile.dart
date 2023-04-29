import 'package:flutter/material.dart';
import 'package:untitled4/src/config/custom_colors.dart';
import 'package:untitled4/src/models/item_model.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({Key? key, required this.item}) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.grey.shade400,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image
            Expanded(child: Image.asset(item.imageUrl)),

            // Name
            Text(item.itemName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),
            
            // Price
            Row(
              children: [
                Text(item.price.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: CustomColors.customSwatchColor
                  ),),

                // Unit
                Text('/${item.unit}',
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
