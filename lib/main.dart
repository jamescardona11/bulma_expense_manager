import 'package:flutter/material.dart';
import 'package:bulma_expense_manager/pages/root_app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: RootApp(),
    );
  }
}
