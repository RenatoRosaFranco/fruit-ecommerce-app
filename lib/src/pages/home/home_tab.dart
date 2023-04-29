import 'package:flutter/material.dart';
import 'package:untitled4/src/config/app_data.dart' as appData;
import 'package:untitled4/src/config/custom_colors.dart';
import 'package:untitled4/src/pages/home/components/category_tile.dart';
import 'package:untitled4/src/pages/home/components/item_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title:
            Text.rich(TextSpan(style: const TextStyle(fontSize: 30), children: [
          TextSpan(
              text: 'Green',
              style: TextStyle(color: CustomColors.customSwatchColor)),
          TextSpan(
              text: 'grocer',
              style: TextStyle(color: CustomColors.customContrastColor)),
        ])),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                  backgroundColor: CustomColors.customContrastColor,
                  label: const Text('2', style: TextStyle(color: Colors.white)),
                  child: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  )),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: 'Pesquise aqui...',
                  hintStyle:
                      TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customContrastColor,
                    size: 21,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none))),
            ),
          ),

          // Categorias
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 25,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTile(
                    onPressed: () {
                      setState(() {
                        selectedCategory = appData.categories[index];
                      });
                    },
                    category: appData.categories[index],
                    isSelected: appData.categories[index] == selectedCategory,
                  );
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: appData.categories.length),
          ),
          // Grid
          Expanded(
            child: GridView.builder(
               padding:  const EdgeInsets.fromLTRB(16, 0, 16, 0),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5,
                ),
                itemCount: appData.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(item: appData.items[index]);
                }),
          )
        ],
      ),
    );
  }
}
