// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:protfolio_web/constants/colors.dart';
import 'package:protfolio_web/views/widgets/assetsImageWidget.dart';

import '../../../contoller/downloadController.dart';
import '../../../contoller/homeSectionController.dart';
import '../../../contoller/hoverContoller.dart';
import '../desktopView.dart';


class Homesections extends StatefulWidget {
  final Size size;


   const Homesections({
    super.key,
    required this.size,
  });

  @override
  _HomesectionsState createState() => _HomesectionsState();
}

class _HomesectionsState extends State<Homesections> with TickerProviderStateMixin {
  late HomesectionController _homesectionController;
  late HoverController _hoverController;

@override
void initState() {
  super.initState();
  _hoverController = HoverController(this);
  _homesectionController = HomesectionController(this, widget.size); // Initialize here
}


  @override
  void dispose() {
    _homesectionController.disposeController(); // Use null-safe check
    super.dispose();
  }

 
  @override
  Widget build(BuildContext context) {
    
      final DownloadController downloadController = DownloadController();
    return LayoutBuilder(
      builder: (context,constraints) {
         _homesectionController.updateScreenSize(Size(constraints.maxWidth, constraints.maxHeight));
        return SizedBox(
          key: sectionKey1,
          height: widget.size.height * 0.9,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: widget.size.width * 0.5, 
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Hello,\nThis is ",
                                style: TextStyle(
                                  color: AppColor.textColorIron,
                                  fontSize: 58,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "JINO R",
                                style: TextStyle(
                                  color: AppColor.textColorNiceBlue,
                                  fontSize: 58,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ", I'm a ",
                                style: TextStyle(
                                  color: AppColor.textColorIron,
                                  fontSize: 58,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "\nFlutter Developer.",
                                style: TextStyle(
                                  color: AppColor.textColorNiceBlue,
                                  fontSize: 58,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: widget.size.height * 0.04),
                      
                      
                       // Download Resume Button with hover effect
                      MouseRegion(
                        onEnter: (_) => _hoverController.onHover(true),
                        onExit: (_) => _hoverController.onHover(false),
                        child: AnimatedBuilder(
                          animation: _hoverController,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _hoverController.getButtonScale(),
                  
                              child: GestureDetector(
                                onTap: () {
                                  downloadController.downloadResume();
                                },
                                child: Container(
                                  height: widget.size.height * 0.06,
                                  width: widget.size.width * 0.12,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: _hoverController.getButtonGradientColors(),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      
                                     _hoverController.getButtonBoxShadow()
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Flexible(
                                          child: Text(
                                            "Download Resume",
                                            style: TextStyle(color: AppColor.textColorIron),
                                          ),
                                        ),
                                        SizedBox(width: widget.size.width * 0.01),
                                        AssetImageWidget(
                                          category: 'icon',
                                          name: 'downloadIcon',
                                          height: widget.size.height * 0.03,
                                          width: widget.size.width * 0.01,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ),
                            );
                          }
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _homesectionController.circleSizeAnimation,
                      builder: (context, child) {
                        return Center(
                          child: Container(
                            height: _homesectionController.circleSizeAnimation.value,
                            width: _homesectionController.circleSizeAnimation.value,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.buttonGradientColorIris.withOpacity(0.5),
                                  spreadRadius: _homesectionController.circleSizeAnimation.value,
                                  blurRadius: _homesectionController.circleSizeAnimation.value,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    AssetImageWidget(
                      category: 'images',
                      name: 'home',
                      width: widget.size.width * 0.3,
                      height: widget.size.height * 0.7,
                    ),
                  ],
                ),
                SizedBox(width: widget.size.width * 0.01),
              ],
            ),
          ),
        );
      }
    );
  }
}
