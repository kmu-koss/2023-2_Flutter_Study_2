import 'package:flutter/material.dart';
import '../components/components.dart';
import '../components/friend_post_list_view.dart';
import '../components/friends_post_tile.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  final mockService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExploreData>(
      future: mockService.getExploreData(),
      builder: (context, snapshot) {
        print(snapshot.connectionState);
        print(snapshot.hasData);

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final todayRecipes = snapshot.data?.todayRecipes ?? [];
            final friendPost = snapshot.data?.friendPosts ?? [];
            return ListView(
              children: [
                TodayRecipeListView(
                  recipes: todayRecipes,
                ),
                const SizedBox(
                  height: 32,
                ),
                FriendPostListView(
                  posts: friendPost,
                ),
              ],
            );
          }
          return Center(
            child: Text('Pleas addd any data'),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
