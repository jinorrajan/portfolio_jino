import 'package:flutter/material.dart';
import 'package:protfolio_web/constants/colors.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: AppColor.backGroundColor1,
    );
  }
}
