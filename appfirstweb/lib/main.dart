import 'package:appfirstweb/const/mycolors.dart';
import 'package:appfirstweb/pages/favorites_page.dart';
import 'package:appfirstweb/pages/generator_page.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: ColorsMyApp.secondarycolor,
              onPrimary: ColorsMyApp.optionalcolor,
              secondary: ColorsMyApp.primarycolor,
              onSecondary: ColorsMyApp.tertiarycolor,
              tertiary: ColorsMyApp.onbackgroundcolor,
              onTertiary: ColorsMyApp.ontertiary,
              error: ColorsMyApp.errorcolor,
              onError: ColorsMyApp.onErrorcolor,
              background: ColorsMyApp.backgroundcolor,
              onBackground: ColorsMyApp.onbackgroundcolor,
              surface: ColorsMyApp.surfacecolor,
              onSurface: ColorsMyApp.onsurfacecolor),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

/// It's a class that extends ChangeNotifier and has a method called getNext() that changes the value of
/// a variable called current and then calls notifyListeners()
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        page = const FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(
                    Icons.home,
                    color: theme.colorScheme.onSecondary,
                  ),
                  label: const Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    Icons.favorite,
                    color: theme.colorScheme.onSecondary,
                  ),
                  label: const Text('Favorites'),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.onTertiary,
             child: page,
            ),
          ),
        ],
      ),
    );
  }
}