import 'package:get/get.dart';
import 'package:pdi_flutter/models/enums/sidebar_enum.dart';

class HomeController extends GetxController {
  /// [selectedSidebarItem] is an [SidebarItem] enum that represents the
  /// current selected item in the home sidebar
  Rx<SidebarItem> selectedSidebarItem = Rx<SidebarItem>(SidebarItem.home);
}
