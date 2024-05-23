import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainController extends GetxController {
  SelectedIndex selectedIndex = SelectedIndex(initialIndex: 0);

  void changeSelectedIndex(int index) {
    selectedIndex.index.value = index;
  }
}

class SelectedIndex {
  final RxInt index = 0.obs;

  SelectedIndex({required int initialIndex}) {
    index.value = initialIndex;
  }
}
