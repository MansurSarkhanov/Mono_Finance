import 'package:mono/Core/Constants/Path/icon_path.dart';

extension IconPathExtension on IconPath {
  String toPathSvg() {
    return "assets/Icons/ic_$name.svg";
  }
}
