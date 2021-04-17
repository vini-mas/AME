import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavUtils {
  final BuildContext context;
  NavUtils(this.context);

  void pushScreen(Widget screen) {
    pushNewScreen(
      context,
      screen: screen,
      withNavBar: true,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  void pushIndependentScreen(Widget screen) {
    pushNewScreen(
      context,
      screen: screen,
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
