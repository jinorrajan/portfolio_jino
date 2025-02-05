import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:protfolio_web/constants/colors.dart';
import 'package:protfolio_web/contoller/skillController.dart';
import 'package:protfolio_web/views/DesktopViews/sections/homeSections.dart';
import '../../contoller/hoverContoller.dart';
import '../widgets/aboutHorizontalHeadingWidget.dart';
import 'sections/aboutSections.dart';
import 'sections/skillSection.dart';

final sectionKey1 = GlobalKey();
final sectionKey2 = GlobalKey();
final sectionKey3 = GlobalKey();
final sectionKey4 = GlobalKey();
final sectionKey5 = GlobalKey();
final sectionKey6 = GlobalKey();

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView>
    with TickerProviderStateMixin {
  late HoverController hoverController; // Declare the hover controller

  @override
  void initState() {
    super.initState();
    hoverController = HoverController(this); // Initialize the hover controller
  }

  @override
  void dispose() {
    hoverController.dispose(); // Dispose of the hover controller when done
    super.dispose();
  }

  void _scrollToSelectedContent(GlobalKey key) {
    final keyContext = key.currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(keyContext,
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final SkillController skillController = SkillController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor1,
      appBar: AppBar(
        backgroundColor: AppColor.backGroundHeaderColor,
        title: TextButton(
          child: const Text(
            "Portfolio",
            style: TextStyle(
              color: AppColor.textColorIron,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            _scrollToSelectedContent(sectionKey1);
          },
        ),
        actions: [
          _buildHoverTextButton("Home", sectionKey1, size),
          SizedBox(width: size.width * 0.02),
          _buildHoverTextButton("About", sectionKey2, size),
          SizedBox(width: size.width * 0.02),
          _buildHoverTextButton("Skill", sectionKey3, size),
          SizedBox(width: size.width * 0.02),
          _buildHoverTextButton("Project", sectionKey4, size),
          SizedBox(width: size.width * 0.02),
          _buildHoverTextButton("Education", sectionKey5, size),
          SizedBox(width: size.width * 0.02),
          _buildHoverTextButton("Contact", sectionKey6, size),
          SizedBox(width: size.width * 0.02),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Homepage
            Homesections(
              size: size,
            ),

            // About Section
            Aboutsections(
              size: size,
            ),

            // SkillSection(size: size, controller: skillController,),
            Container(
              key: sectionKey4,
              height: size.height * 0.9,
              color: Colors.pink,
            ),
            Container(
              key: sectionKey5,
              height: size.height * 0.9,
              color: Colors.purpleAccent,
            ),
          ],
        ),
      ),
    );
  }

  // Custom method to handle hover effect using the controller
  Widget _buildHoverTextButton(String label, GlobalKey sectionKey, Size size) {
    return MouseRegion(
      onEnter: (_) => hoverController.setHovered(
          label, true), // Set hover state for specific button
      onExit: (_) => hoverController.setHovered(
          label, false), // Reset hover state for specific button
      child: ValueListenableBuilder(
        valueListenable: hoverController, // Listen to hover state changes
        builder: (context, _, child) {
          bool isHovered = hoverController
              .isHovered(label); // Get hover state for this button
          return GestureDetector(
            onTap: () {
              _scrollToSelectedContent(sectionKey);
            },
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Ensures the Column only takes necessary space
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                // Main Text (increased font size on hover)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(
                      0, isHovered ? 5 : 0, 0), // Move text down on hover
                  child: Text(
                    label,
                    style: TextStyle(
                      color: isHovered
                          ? AppColor.textColorIron
                          : AppColor.textColorNaturalGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: isHovered
                          ? 16
                          : 14, // Increase font size when hovered
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                // Underline (visible on hover)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 2,
                  width: isHovered ? 30 : 0, // Show underline when hovered
                  color: AppColor.textColorNiceBlue,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
