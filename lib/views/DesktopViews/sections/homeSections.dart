// ignore_for_file: library_private_types_in_public_api

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
    _homesectionController = HomesectionController(this);
  }

  @override
  void dispose() {
    _homesectionController.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      final DownloadController downloadController = DownloadController();
    return SizedBox(
      key: sectionKey1,
      height: widget.size.height * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(left: 50, bottom: 20, right: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
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
            Stack(
              children: [
                AnimatedBuilder(
                  animation: _homesectionController.circleSizeAnimation,
                  builder: (context, child) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 150,bottom: 10),
                      child: Center(
                        child: Container(
                          height: _homesectionController.circleSizeAnimation.value,
                          width: _homesectionController.circleSizeAnimation.value,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.buttonGradientColorIris.withOpacity(0.5),
                                spreadRadius: _homesectionController.circleSizeAnimation.value,
                                blurRadius: _homesectionController.circleSizeAnimation.value / 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50,left: 18),
                  child: AssetImageWidget(
                    category: 'images',
                    name: 'home',
                    width: widget.size.width * 0.3,
                    height: widget.size.height * 0.7,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
