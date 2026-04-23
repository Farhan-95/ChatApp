import 'package:flutter/widgets.dart';

  class Responsive {
    final BuildContext context;

    Responsive(this.context);

  double get width => MediaQuery.sizeOf(context).width;
  double get height => MediaQuery.sizeOf(context).height;
}