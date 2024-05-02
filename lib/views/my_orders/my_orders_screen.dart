import 'package:flutter/material.dart';

import '../../widgets/bottom_nav_bar_widget.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders screen'),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
