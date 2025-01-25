
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class aboutHortizontalHeadingWidget extends StatelessWidget {
   const aboutHortizontalHeadingWidget({
    super.key,
    required this.size,
  });

  final Size size;
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // Center all children in the stack
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Container(
            width: size.width * 0.001, // Thin vertical line
            height: size.height * 0.37, // Line height
            color: AppColor.textColorIron,
          ),
        ),
        Transform.rotate(
           angle: -90 *
                    (3.14159265359 /
                        180),
          child: Container(
            width: size.width * 0.080, // Smaller width to fit screen
            height: size.height * 0.08, // Height should match the line
              
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
             
                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: AppColor().getButtonGradientColors(),
                                ),
            
            ),
            child: const Center(
              child:  Text(
                'About Me',
                style: TextStyle(letterSpacing: 1.6,
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
