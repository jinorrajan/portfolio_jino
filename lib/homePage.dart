import 'package:flutter/material.dart';
import 'package:protfolio_web/views/mobileViews/mobile_view.dart';
import 'package:protfolio_web/views/tabletViews/tab_view.dart';

import 'views/DesktopViews/desktopView.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (context, constraints){

      // if Screen width greater than 950 it show desktopView
      if(constraints.maxWidth>951){
        return const DesktopView();
      }

      // if Screen width greater than 600 it show tabView
      else if(constraints.maxWidth>601){
          return const TabView();
      }

      //  it show mobileView
        else{
          return const MobileView();
      }
    }
    );
  }
}
