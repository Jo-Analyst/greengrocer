import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/home/components/category_tile.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = "Frutas";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Grenn",
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                ),
              ),
              TextSpan(
                text: "grocer",
                style: TextStyle(
                  color: CustomColors.customContrastColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: CustomColors.customContrastColor,
                label: const Text(
                  "0",
                  style: TextStyle(fontSize: 12),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          // campo de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: "Pesquise aqui...",
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customContrastColor,
                  size: 21,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: BorderSide.none),
              ),
            ),
          ),

          // categorias

          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                String category = app_data.categories[index];
                return CategoryTile(
                  onPressed: () {
                    selectedCategory = app_data.categories[index];
                    setState(() {});
                  },
                  category: category,
                  isSelected: category == selectedCategory,
                );
              },
              separatorBuilder: (_, __) => const SizedBox(
                width: 10,
              ),
              itemCount: app_data.categories.length,
            ),
          ),

          // grid
          Expanded(
            child: GridView.builder(
              physics:const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 2,
                childAspectRatio: 9 / 11.5
              ),
              itemCount: app_data.items.length,
              itemBuilder: (_, index) {
                return Container(
                  color: Colors.red,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
