import 'package:cupertino_store/src/config/theme/theme_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/widgets/product_list_tab.dart';
import 'ui/widgets/search_tab.dart';
import 'ui/widgets/shopping_cart_tab.dart';

class CupertinoStoreApp extends StatelessWidget {
  final themeBloc = ThemeBloc();
  CupertinoStoreApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return StreamBuilder<ThemeMode>(
      stream: themeBloc.themeStream,
      initialData: themeBloc.currentTheme,
      builder: (context, snapshot) {
        final currentTheme = snapshot.data;
        return CupertinoApp(
          theme: currentTheme == ThemeMode.light
              ? const CupertinoThemeData(brightness: Brightness.light)
              : const CupertinoThemeData(brightness: Brightness.dark),
          home: CupertinoStoreHomePage(isDarkMode: currentTheme == ThemeMode.dark),
        );
      },
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  final bool isDarkMode;

  const CupertinoStoreHomePage({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => const CupertinoPageScaffold(
                child: ProductListTab(),
              ),
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => const CupertinoPageScaffold(
                child: SearchTab(),
              ),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => const CupertinoPageScaffold(
                child: ShoppingCartTab(),
              ),
            );
          default:
            throw Exception('Invalid index $index');
        }
      },
    );
  }
}
