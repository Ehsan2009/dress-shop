import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/model/cloth.dart';

class CartClothNotifier extends StateNotifier<List<Cloth>> {
  CartClothNotifier() : super([]);

  bool cartClothStatus(Cloth cloth) {
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

final cartClothProvider =
    StateNotifierProvider<CartClothNotifier, List<Cloth>>((ref) {
  return CartClothNotifier();
});