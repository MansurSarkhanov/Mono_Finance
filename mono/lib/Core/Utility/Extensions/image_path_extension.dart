import 'package:mono/Core/Constants/Path/image_path.dart';

extension ImagePathExtension on ImagePath {
  String toPathSvg() {
    return "assets/Images/Svg/im_$name.svg";
  }
  String toPathPng() {
    return "assets/Images/im_$name.png";
  }
}
