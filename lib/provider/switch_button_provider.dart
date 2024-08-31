import 'package:flutter_riverpod/flutter_riverpod.dart';

// notification button provider
class NotificationNotifier extends StateNotifier<bool> {
  NotificationNotifier() : super(true);

  void switchValue() {
    state = !state;
  }
}

final notificationProvider =
    StateNotifierProvider<NotificationNotifier, bool>((ref) {
  return NotificationNotifier();
});


// update button provider
class UpdateNotifier extends StateNotifier<bool> {
  UpdateNotifier() : super(true);

  void switchValue() {
    state = !state;
  }
}

final updateProvider =
    StateNotifierProvider<UpdateNotifier, bool>((ref) {
  return UpdateNotifier();
});
