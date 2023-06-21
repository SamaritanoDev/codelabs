import 'package:cupertino_store/src/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'src/models/app_state_model.dart';

void main() {
  return runApp(
    ChangeNotifierProvider<AppStateModel>(
      create: (_) => AppStateModel()..loadProducts(), // NEW
      child: CupertinoStoreApp(), // NEW
    ),
  );
}
