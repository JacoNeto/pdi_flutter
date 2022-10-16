import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_flutter/controllers/home/home_controller.dart';
import 'package:pdi_flutter/models/enums/sidebar_enum.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../../controllers/home/grid_controller.dart';

class AppSidebar extends StatelessWidget {
  AppSidebar({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final GridController _gridController = Get.find();
  final HomeController _homeController = Get.find();
  final SidebarXController _controller;
  static const primaryColor = Color(0xFF685BFF);
  static const canvasColor = Color(0xFF2E2E48);
  static const scaffoldBackgroundColor = Color(0xFF464667);
  static const accentCanvasColor = Color(0xFF3E3E61);
  static const white = Colors.white;
  final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
  final divider = Divider(color: white.withOpacity(0.3), height: 1);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SidebarX(
          controller: _controller,
          theme: SidebarXTheme(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: canvasColor,
              borderRadius: BorderRadius.circular(20),
            ),
            hoverColor: scaffoldBackgroundColor,
            textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
            selectedTextStyle: const TextStyle(color: Colors.white),
            itemTextPadding: const EdgeInsets.only(left: 30),
            selectedItemTextPadding: const EdgeInsets.only(left: 30),
            itemDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: canvasColor),
            ),
            selectedItemDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: actionColor.withOpacity(0.37),
              ),
              gradient: const LinearGradient(
                colors: [accentCanvasColor, canvasColor],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.28),
                  blurRadius: 30,
                )
              ],
            ),
            iconTheme: IconThemeData(
              color: Colors.white.withOpacity(0.7),
              size: 20,
            ),
            selectedIconTheme: const IconThemeData(
              color: Colors.white,
              size: 20,
            ),
          ),
          extendedTheme: const SidebarXTheme(
            width: 200,
            decoration: BoxDecoration(
              color: canvasColor,
            ),
          ),
          footerDivider: divider,
          headerBuilder: (context, extended) {
            return const SizedBox(
              height: 100,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  Icons.image_aspect_ratio,
                  size: 50,
                ),
              ),
            );
          },
          items: [
            SidebarXItem(
              icon: Icons.home,
              label: 'Home',
              onTap: () {
                debugPrint(_controller.selectedIndex.toString());
                _homeController.selectedSidebarItem.value = SidebarItem.home;
              },
            ),
            if (_gridController.needAloneOperations.value)
              SidebarXItem(
                  icon: Icons.crop_square,
                  label: 'Geométricas',
                  onTap: () {
                    _homeController.selectedSidebarItem.value =
                        SidebarItem.geometric;
                  }),
            if (_gridController.needAloneOperations.value)
              SidebarXItem(
                  icon: Icons.people,
                  label: 'Conversão',
                  onTap: () {
                    _homeController.selectedSidebarItem.value =
                        SidebarItem.conversion;
                  }),
            if (_gridController.needAloneOperations.value)
              SidebarXItem(
                  icon: Icons.favorite,
                  label: 'Pseudocor',
                  onTap: () {
                    _homeController.selectedSidebarItem.value =
                        SidebarItem.pseudocolor;
                  }),
            if (_gridController.needAloneOperations.value)
              SidebarXItem(
                  icon: Icons.favorite,
                  label: 'Filtros passa-baixa',
                  onTap: () {
                    _homeController.selectedSidebarItem.value =
                        SidebarItem.lowpass;
                  }),
            if (_gridController.needAloneOperations.value)
              SidebarXItem(
                  icon: Icons.favorite,
                  label: 'Filtros passa-alta',
                  onTap: () {
                    _homeController.selectedSidebarItem.value =
                        SidebarItem.highpass;
                  }),
            if (_gridController.needAloneOperations.value)
              SidebarXItem(
                  icon: Icons.favorite,
                  label: 'Halftoning',
                  onTap: () {
                    _homeController.selectedSidebarItem.value =
                        SidebarItem.halftoning;
                  }),
            if (_gridController.needAloneOperations.value)
              SidebarXItem(
                  icon: Icons.favorite,
                  label: 'Realce',
                  onTap: () {
                    _homeController.selectedSidebarItem.value =
                        SidebarItem.enhancement;
                  }),
            SidebarXItem(
                iconWidget: const FlutterLogo(size: 20),
                label: 'Sobre',
                onTap: () {
                  _homeController.selectedSidebarItem.value = SidebarItem.about;
                }),
          ],
        ));
  }
}
