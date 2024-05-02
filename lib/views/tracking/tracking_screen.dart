import 'package:flutter/material.dart';

import '../../widgets/bottom_nav_bar_widget.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking screen'),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
