import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/model/cloth.dart';

class FavoriteClothNotifier extends StateNotifier<List<Cloth>> {
  FavoriteClothNotifier() : super([]);

  bool favoriteClothStatus(Cloth cloth) {
    final isAvailable = state.contains(cloth);

    if (isAvailable == true) {
      state = state.where((c) => c.clothId != cloth.clothId).toList();
      return false;
    } else {
    state = [...state, cloth];
    return true;
    }
  }

  void setPlants(List<Cloth> plants) {
    state = plants;
  }
}

final favoriteClothProvider =
    StateNotifierProvider<FavoriteClothNotifier, List<Cloth>>((ref) {
  return FavoriteClothNotifier();
});