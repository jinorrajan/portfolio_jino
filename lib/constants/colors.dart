import 'dart:ui';

class AppColor{

  static const Color backGroundColor1 =  Color.fromRGBO(0, 0, 0, 1);
  static const Color backGroundHeaderColor =  Color.fromRGBO(0, 0, 16, 1);

  static const Color backGroundColor2 =Color.fromRGBO(0, 0, 16, 1);
  static const Color textColorNiceBlue = Color.fromRGBO(77, 75, 184, 1);
  static const Color textColorIron = Color.fromRGBO(250, 251, 252, 1);
  static const Color textColor2 = Color.fromRGBO(209, 213, 219, 1);

  static const Color textColorNaturalGrey = Color.fromRGBO(143, 132, 132, 1);

  static const Color buttonGradientColorIris = Color.fromRGBO(77, 75, 184, 1);
  static const Color buttonGradientColorCloudBurst = Color.fromRGBO(34, 33, 82, 1);

 List<Color> getButtonGradientColors() {
    return  [
            AppColor.buttonGradientColorIris,
            AppColor.buttonGradientColorCloudBurst
          ];
       
  }

}