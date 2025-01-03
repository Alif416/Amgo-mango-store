import 'package:flutter/material.dart';
import 'package:myapp/constants/global_variables.dart';
import 'package:myapp/features/account/screens/account_screen.dart';
import 'package:myapp/features/cart/screens/cart_screen.dart';
import 'package:myapp/features/category_grid/category_grid_screen.dart';
import 'package:myapp/features/home/screens/home_screen.dart';
import 'package:myapp/main.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;



class BottomBar extends StatefulWidget {
  static const String routeName = "/actual-home";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    CategoryGridScreen(),
    const AccountScreen(),
    const CartScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    myTextTheme = Theme.of(context).textTheme;
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //HOME PAGE
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: _page == 0
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          // CATEGORIES
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: _page == 1
                  ? const Icon(Icons.grid_view_sharp)
                  : const Icon(Icons.grid_view_outlined),
            ),
            label: '',
          ),
          //ACCOUNT
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: _page == 2
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth),
                ),
              ),
              child: _page == 2
                  ? const Icon(Icons.person_rounded)
                  : const Icon(Icons.person_outlined),
            ),
            label: '',
          ),
          //CART
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 3
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: badges.Badge(
                // displaying no of items in cart
                badgeContent: Text("$userCartLen",
                    style: const TextStyle(color: Colors.white)),

                badgeStyle: const badges.BadgeStyle(
                    badgeColor: Color.fromARGB(255, 19, 17, 17)),
                child: _page == 3
                    ? const Icon(Icons.shopping_cart_rounded)
                    : const Icon(
                        Icons.shopping_cart_outlined,
                      ),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
