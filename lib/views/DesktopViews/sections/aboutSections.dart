// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:protfolio_web/constants/colors.dart';
import 'package:protfolio_web/views/widgets/assetsImageWidget.dart';

import '../../../contoller/aboutSectionController.dart';
import '../../widgets/aboutHorizontalHeadingWidget.dart';
import '../desktopView.dart';

class Aboutsections extends StatefulWidget {
  Size size;
  Aboutsections({
    super.key,
    required this.size,
  });

  @override
  State<Aboutsections> createState() => _AboutsectionsState();
}

class _AboutsectionsState extends State<Aboutsections> with TickerProviderStateMixin {

  late AboutSectionController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AboutSectionController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey2,
      width: widget.size.width,
      height: widget.size.height * 0.9,
      color: AppColor.backGroundHeaderColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // About left side Heading widget
                aboutHortizontalHeadingWidget(size: widget.size),
                SizedBox(width: widget.size.width * 0.04),

                // Profile Image widget
                Container(
                  height: widget.size.height * 0.4,
                  width: widget.size.height * 0.4, // Ensure it's a perfect circle
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor
                        .textColorIron, // Background color inside the circle
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape:
                          BoxShape.circle, // Ensures the child fits the circle
                    ),
                    child: ClipOval(
                      child: AssetImageWidget(
                        category: 'images',
                        name: 'profile',
                        width: widget.size.height *
                            0.38, // Adjust to fit inside the padding
                        height: widget.size.height * 0.38,
                        // Ensures image fits inside the circle
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const  Text('Curious about me? ', style: TextStyle(
                          color: AppColor.textColorNiceBlue,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),),
                        SizedBox(height: widget.size.height * 0.02),
                    SizedBox(
                      width: widget.size.width * 0.50,
                      child: const Text(
                        textAlign: TextAlign.justify,
                        'I am Jino R., a passionate Flutter developer with 1 year of experience, including a 6-month internship and self-taught learning. I hold a B.E. in Artificial Intelligence and Data Science. I specialize in creating modern, user-friendly applications, combining state-of-the-art technology with clean, responsive designs. My portfolio includes innovative projects like a matrimony app, a dating app called Soul Whisper, and a weather app, showcasing my skills in Firebase integration, state management, and delivering exceptional user experiences.',
                        style: TextStyle(
                          color: AppColor.textColor2,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
