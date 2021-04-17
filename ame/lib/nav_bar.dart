import 'package:ame/src/screens/teachers_list/teachers_list_screen.dart';
import 'package:ame/src/styles/ame_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

//https://pub.dev/packages/persistent_bottom_nav_bar
class NavBar extends StatefulWidget {
  static const String routeName = '/nav_bar';

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _navScreens() {
    return [
      SafeArea(
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Text(
            "Perfil de Usuário",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: AmeColors.primarySalmon),
          ),
        ),
      ),
      TeachersListScreen(),
      SafeArea(
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Text(
            "Enquetes de Professores",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: AmeColors.primaryGreen),
          ),
        ),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(
            FontAwesomeIcons.solidUser,
          ),
          title: ("Perfil"),
          activeColorPrimary: AmeColors.primarySalmon,
          inactiveColorPrimary: AmeColors.lightGray),
      PersistentBottomNavBarItem(
          icon: Icon(
            Icons.school,
            size: 32,
          ),
          title: ("Professores"),
          activeColorPrimary: AmeColors.primaryBlue,
          inactiveColorPrimary: AmeColors.lightGray),
      PersistentBottomNavBarItem(
          icon: Stack(
            children: [
              Icon(FontAwesomeIcons.solidComment),
              Align(
                alignment: Alignment.center,
                widthFactor: 1.7,
                heightFactor: 1.7,
                child: Icon(
                  FontAwesomeIcons.check,
                  color: AmeColors.white,
                  size: 15,
                ),
              ),
            ],
          ),
          title: ("Enquetes"),
          activeColorPrimary: AmeColors.primaryGreen,
          inactiveColorPrimary: AmeColors.lightGray),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _navScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style9,
      ),
    );
  }
}
