import 'package:flutter/material.dart';
import 'package:untitled4/src/config/custom_colors.dart';
import 'package:untitled4/src/home/components/category_tile.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> categories = [
    'Frutas',
    'Grãos',
    'Verduras',
    'Temperos',
    'Cereais'
  ];

  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text.rich(
            TextSpan(style: const TextStyle(fontSize: 30), children: [
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
                  hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14
                  ),
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
                        selectedCategory = categories[index];
                      });
                    },
                    category: categories[index],
                    isSelected: categories[index] == selectedCategory,
                  );
                }, separatorBuilder: (_, index) {
              return const SizedBox(
                width: 10,
              );
            }, itemCount: categories.length),
          )

          // Grid
        ],
      ),
    );
  }
}
