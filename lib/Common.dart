import 'package:flutter/cupertino.dart';

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

Widget customBox({double height = 0.0, double width = 0.0}) {
  return SizedBox(height: height, width: width);
}
