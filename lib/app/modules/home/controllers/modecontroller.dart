import 'package:get/get.dart';

class ViewModeController extends GetxController {
  // ignore: prefer_final_fields
  RxBool _isGridView = false.obs; 

  bool get isGridView => _isGridView.value;

  void  toggleViewMode() {
    _isGridView.value = !_isGridView.value;
  }
}