import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../contoller/skillController.dart';
import '../../widgets/aboutHorizontalHeadingWidget.dart';
import '../desktopView.dart';
 // Import the SkillController

class SkillSection extends StatelessWidget {
   SkillSection({
    super.key,
    required this.size,
    required this.controller, // Accept the controller as a parameter
  });

  final Size size;
  final SkillController controller; // Reference to the SkillController

  final List<Map<String, String>> items = [
    {"text": "Flutter", "image": "assets/images/fl.png"},
    {"text": "Dart", "image": "assets/images/dart 1.png"},
    {"text": "Firebase", "image": "assets/images/fir.png"},
    {"text": "Hve", "image": "assets/images/hiv.png"},
    {"text": "Getx", "image": "assets/images/get.png"},
    {"text": "Figma", "image": "assets/images/fig.png"},
    {"text": "Bloc", "image": "assets/images/bloc 1.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: sectionKey3,
      height: size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.04),

            // Heading Widget
            HeadingWidget(size: size, text: "Skills"),
            SizedBox(height: size.height * 0.09),

            // Carousel Slider
            Expanded(
              child: ValueListenableBuilder<int>(
                valueListenable: controller.currentIndexNotifier, // Listen to changes in the index
                builder: (context, currentIndex, child) {
                  return CarouselSlider(
                    items: items.map((item) {
                      int index = items.indexOf(item);
                      bool isActive = index == currentIndex; // Check if item is active
                      return Container(
                        width: size.width * 0.18, // Fixed width
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColor.textColorNiceBlue // Active background color
                              : AppColor.courserSliderBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(item["image"]!, scale: 1), // Image
                            SizedBox(height: size.height * 0.03),
                            Text(
                              item["text"]!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: isActive
                                    ? Colors.white // Active text color
                                    : AppColor.textColorIron,
                              ),
                            ), // Text
                          ],
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: size.height * 0.34, // Set the height for the carousel
                      enlargeCenterPage: true,
                      autoPlay: false,
                      enableInfiniteScroll: true,
                      viewportFraction: 0.3, // Show part of next/prev items
                      onPageChanged: (index, reason) {
                        controller.updateIndex(index); // Update index in controller
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
