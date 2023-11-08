import 'package:flutter/material.dart';
import '../models/models.dart';
import 'components.dart';

class RecipesGridView extends StatelessWidget {
  const RecipesGridView({super.key, required this.recipes});

  static const _gridPadding = 10.0;
  final List<SimpleRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(_gridPadding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: _gridPadding,
        crossAxisSpacing: _gridPadding,
      ),
      itemBuilder: (BuildContext context, int index) {
        return RecipeThumbnail(
          recipe: recipes[index],
        );
      },
      itemCount: recipes.length,
    );
  }
}
