import 'package:flutter/material.dart';
import 'package:mealsapp/data/datas.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/screens/meal_list.dart';
import 'package:mealsapp/widgets/category_card.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  void _selectCategory(BuildContext context, Category category) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealList(
        meals: meals
            .where((element) => element.categoryId == category.id)
            .toList(),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bir kategori seçin")),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 2,
        ),
        children: [
          for (final category in categories)
            CategoryCard(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 49, 48, 48),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.yellow,
                    Colors.pink,
                    Colors.purple,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menü',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            for (var item in categories)
              ListTile(
                title: Text(item.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MealList(
                        meals: meals
                            .where((element) => element.categoryId == item.id)
                            .toList(),
                      ),
                    ),
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}
