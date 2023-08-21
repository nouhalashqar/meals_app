import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);
  void tiggleMealFavoriteStatus(Meal meal) {
    // to change meal status (Favorite or Unfavorite)
    final mailIsFavorite = state.contains(meal);
    if (mailIsFavorite) {
      state =
          state.where((m) => m.id != meal.id).toList(); // for remove the meal
    } else {}
    state = [...state, meal];
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) {
  return FavoritesMealsNotifier();
});
