import 'package:appfirstweb/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);
    final style = theme.textTheme.labelMedium!.copyWith(
      color: theme.colorScheme.secondary,
    );

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text(
          'No favorites yet.',
          style: theme.textTheme.bodyLarge,
        ),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
              'You have '
              '${appState.favorites.length} favorites:',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onSecondary,
              )),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite, color: theme.colorScheme.secondary),
            title: Text(
              pair.asLowerCase,
              style: style,
            ),
          ),
      ],
    );
  }
}
