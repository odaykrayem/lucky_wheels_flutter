import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucky_wheels_flutter/constants/background_grad.dart';
import 'package:lucky_wheels_flutter/constants/colors.dart';
import 'package:lucky_wheels_flutter/constants/dimensions.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:lucky_wheels_flutter/pages/auth/sign_in_page.dart';
import 'package:lucky_wheels_flutter/pages/home/timer_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    Duration duration = const Duration();
    Map<_SelectedTab, Widget> screens = {
      _SelectedTab.home: TimerScreen(),
      _SelectedTab.favorite: SignInPage()
    };
    return SafeArea(
      child: Container(
        decoration: BackGroundGradient.background1,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          appBar: AppBar(
            leading: Icon(
              Icons.interests_rounded,
              size: Dimensions.iconSize16 * 2.5,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: screens[_selectedTab],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: DotNavigationBar(
              margin: const EdgeInsets.only(left: 10, right: 10),
              currentIndex: _SelectedTab.values.indexOf(_selectedTab),
              dotIndicatorColor: Colors.white,
              unselectedItemColor: Colors.grey[300],
              paddingR: const EdgeInsets.all(0),
              // enableFloatingNavBar: true,
              onTap: _handleIndexChanged,
              items: [
                /// Home
                DotNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    selectedColor: AppColors.selected_item,
                    unselectedColor: AppColors.unselected_item),

                /// Likes
                DotNavigationBarItem(
                    icon: Icon(Icons.account_balance_wallet),
                    selectedColor: AppColors.selected_item,
                    unselectedColor: AppColors.unselected_item),

                /// Search
                DotNavigationBarItem(
                    icon: Icon(Icons.wallet_giftcard_rounded),
                    selectedColor: AppColors.selected_item,
                    unselectedColor: AppColors.unselected_item),

                /// Profile
                DotNavigationBarItem(
                    icon: Icon(Icons.person),
                    selectedColor: AppColors.selected_item,
                    unselectedColor: AppColors.unselected_item),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
