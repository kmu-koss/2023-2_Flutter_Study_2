import 'package:flutter/material.dart';

import '../models/models.dart';

class RecipeThumbnail extends StatelessWidget {
  const RecipeThumbnail({super.key, required this.recipe});
  final SimpleRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //   height: 160,
        //   width: 160,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage(
        //         recipe.dishImage,
        //       ),
        //       fit: BoxFit.cover,
        //     ),
        //     borderRadius: const BorderRadius.all(
        //       Radius.circular(16.0),
        //     ),
        //   ),
        // ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              recipe.dishImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          recipe.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          recipe.duration,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
