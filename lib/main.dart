import 'package:flutter/material.dart';
import 'package:bulma_expense_manager/pages/root_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: RootApp(),
      ),
    );
  }
}
