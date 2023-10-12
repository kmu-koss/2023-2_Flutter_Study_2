import 'package:flutter/material.dart';
import 'package:recipes/recipe_detail.dart';
import 'recipe_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            try {
              return GestureDetector(
                onTap: () {
                  // when user tap, this body code runs
                  print(Recipe.samples[index].label);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RecipeDetail(
                      recipe: Recipe.samples[index],
                    );
                  }));
                },
                child: buildRecipeCard(Recipe.samples[index]),
              );
            } catch (e, s) {
              print(s);
            }
          }),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Image.asset(recipe.imageUrl),
            const SizedBox(
              height: 5,
            ),
            Text(recipe.label),
          ],
        ),
      ),
    );
  }
}
